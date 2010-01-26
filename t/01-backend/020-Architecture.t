#!/usr/bin/perl
use strict;
use warnings;

use Test::More;
use Test::Exception;
use PDT::Server::Test;
use Data::Dumper;

dbinit();

my $CLASS = 'PDT::Server::Architecture';
use_ok( $CLASS );

can_ok( $CLASS, qw/hosts requests/ );

ok( my $one = $CLASS->new( id => 1001 ), "Get one" );
is_deeply(
    $one,
    {
        id => 1001,
        name => 'x86',
    },
    "Got one"
);

done_testing();
