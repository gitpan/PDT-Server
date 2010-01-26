package PDT::Server::Util::Transactions;
use strict;
use warnings;

use PDT::Server::Schema;
use Moose;
use MooseX::ClassAttribute;
use MooseX::Types::Moose qw/ Str ArrayRef /;

our @EXPORT = qw/start_transaction rollback_transaction commit_transaction transaction_do in_transaction/;

use base 'Exporter';

class_has dbh => (
    is => 'ro',
    default => sub { PDT::Server::Schema->source->dbh }
);

class_has __autoname => (
    isa => Str,
    is => 'rw',
    default => 'AAAAAAAA',
);

class_has transactions => (
    isa => ArrayRef,
    is => 'ro',
    default => sub {[]},
);

sub in_transaction {
    return @{ __PACKAGE__->transactions } ? 1 : 0;
}

sub _autoname {
    my $class = shift;
    my $name = $class->__autoname;
    $class->__autoname( ++$name );
    return $name . "_" . $$;
}

sub start_transaction {
    my ( $name ) = @_;
    my $transactions = __PACKAGE__->transactions;

    __PACKAGE__->dbh->begin_work() unless @$transactions;

    $name ||= __PACKAGE__->_autoname;
    push @$transactions => $name;
    __PACKAGE__->dbh->pg_savepoint( $name );
    return $name;
}

sub rollback_transaction {
    my ( $name ) = @_;
    my $transactions = __PACKAGE__->transactions;

    croak( "No such transaction: $name" )
        if $name and !grep { $_ eq $name } @$transactions;
    croak( "No current transaction" )
        unless @$transactions;

    $name ||= pop( @$transactions );

    if ( $transactions->[0] eq $name ) {
        @$transactions = ();
        return __PACKAGE__->dbh->rollback;
    }

    while ( my $txn = pop( @$transactions )) {
        _rollback_one( $txn );
        last if $txn eq $name;
    }
}

sub _rollback_one {
    my ( $name ) = @_;
    my $transactions = __PACKAGE__->transactions;

    __PACKAGE__->dbh->pg_rollback_to( $name );
}

sub commit_transaction {
    my ( $name ) = @_;
    my $transactions = __PACKAGE__->transactions;

    croak( "No such transaction: $name" )
        if $name and !grep { $_ eq $name } @$transactions;
    croak( "No current transaction" )
        unless @$transactions;

    $name ||= pop( @$transactions );

    if ( $transactions->[0] eq $name ) {
        __PACKAGE__->dbh->pg_release( $_ ) for @$transactions;
        @$transactions = ();
        return __PACKAGE__->dbh->commit;
    }

    while ( my $txn = pop(@$transactions) ) {
        __PACKAGE__->dbh->pg_release( $txn );
        last if $txn eq $name;
    }
}

sub transaction_do {
    my ( $sub ) = @_;
    my $name = start_transaction();
    eval { $sub->() };
    if ( my $out = $@ ) {
        rollback_transaction( $name ) if $out;
        croak( "Transaction aborted: $@" );
    }
    else {
        commit_transaction( $name ) unless $out;
        return 1;
    }
}

1;
