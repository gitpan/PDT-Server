package PDT::Server::Test::Data;
use strict;
use warnings;
use autodie;

use Moose;
use MooseX::Types::Moose qw/Int ArrayRef HashRef Str/;
use MooseX::ClassAttribute;
use YAML::Syck qw/LoadFile/;

use PDT::Server::Test;
use PDT::Server::Util::Transactions;

class_has schema => (
    isa => 'Fey::Schema',
    is => 'ro',
    lazy => 1,
    default => sub {
        require PDT::Server::Schema;
        PDT::Server::Schema->Schema();
    },
);

class_has tables => (
    isa => ArrayRef,
    is => 'ro',
    lazy => 1,
    default => sub {[ map { $_->name } __PACKAGE__->schema->tables ]}
);

has data_set => (
    isa => Str,
    is => 'ro',
    default => 'base',
    lazy => 1
);

has data_dir => (
    isa => Str,
    is => 'ro',
    default => sub { "t/testdata/" . $_[0]->data_set },
    lazy => 1
);

has fixtures => (
    isa => ArrayRef,
    is => 'ro',
    default => \&_get_fixtures,
    lazy => 1
);

has transaction => (
    is => 'rw',
);

sub _get_fixtures {
    my $self = shift;
    my $data_dir = $self->data_dir;
    opendir( my $fix_dir, $data_dir );
    #Grab the yaml files
    my @files = grep { -f "$data_dir/$_" && m/\.yaml$/ } readdir( $fix_dir );
    closedir( $fix_dir );
    #Sort them and preappend the path.
    return [ map { "$data_dir/$_" } sort @files ];
}

sub clear {
    my $self = shift;

    my $transaction = $self->transaction;
    return unless $transaction;

    rollback_transaction( $transaction );
}

sub setup {
    my $self = shift;

    $self->clear;
    $self->transaction( start_transaction() );

    $self->load( $_ ) for @{ $self->fixtures };
}

sub _fixture_to_table {
    my $self = shift;
    my ( $fixture ) = @_;
    my $name = $fixture;
    $name =~ s,^.*/[\d-]*([^\d/][^/]*)\.yaml$,$1,g;
    return $name if grep { $_ eq $name } @{ $self->tables };
    return undef;
}

sub load {
    my $self = shift;
    my ( $fixture ) = @_;
    my $data = LoadFile( $fixture );
    return unless $data;

    my $table_name = $self->_fixture_to_table( $fixture );
    croak( "Could not find table for: $fixture" ) unless $table_name;

    my $require = $table_name;
    $require = join( '::', "PDT::Server", map { ucfirst(lc( $_ ))} split( '_', $require));
    eval "require $require";
    croak( "Could not load module '$require': $@" ) if $@;

    my $table = $self->schema->table( $table_name );
    my $class = Fey::Meta::Class::Table->ClassForTable( $table );
    croak( "Could not find class for table: $table_name" ) unless $class;

    for my $item ( values %$data ) {
        $class->insert( %$item );
    }
}

1;
