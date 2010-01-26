package PDT::Server::Test;
use strict;
use warnings;
use Carp;
use Test::More;
use PDT::Server::Config;
use Cwd;
use Data::Dumper;

BEGIN {
    {
        no strict 'refs';
        no warnings 'redefine';
        *PDT::Server::Config::configs = sub {
            [
                $ENV{ 'PDT_SERVER_CONFIG' } || 'server.yaml',
                getcwd() =~ m,/t/?$, ? '../server.yaml' : './server.yaml'
            ];
        };
    }
    my $config = PDT::Server::Config->new;

    unless ( $config->dbtype && $config->dbname ){
        diag "\n" . <<EOT;
Please create a server.yaml file in the current directory, or use the
following environment variables:
 PDT_TEST_DBNAME - Database name
 PDT_TEST_DBUSER - Database username
 PDT_TEST_DBPASS - Database password
EOT

        plan skip_all => "No database configured."
    }
}

use PDT::Server::Test::Data;
use PDT::Server::Util::Transactions;

our $NO_TRANSACTION;
our $TRANSACTION;
our $FIRSTCALLER;
our $DATA = PDT::Server::Test::Data->new();

sub import {
    my $class = shift;
    my @args = @_;

    $FIRSTCALLER ||= [ caller()];

    unless ( grep { $_ eq '-dbinit' } @args ){
        no strict 'refs';
        my ( $caller ) = caller();
        my $ref = $caller . '::dbinit';
        *$ref = \&dbinit unless( defined &$ref );
    }

    ($NO_TRANSACTION) ||= grep { $_ eq '-transaction' } @args;

    $TRANSACTION = start_transaction()
        unless ( $TRANSACTION || $NO_TRANSACTION );

    croak <<EOT
flag '-transaction' specified, but transaction was already started.
Transaction started by:
    package: $FIRSTCALLER->[0]
    filename: $FIRSTCALLER->[1]
    line: $FIRSTCALLER->[2]
EOT
        if ( $TRANSACTION && $NO_TRANSACTION );
}

sub dbinit { $DATA->setup }

1;
