#!/usr/bin/perl
use strict;
use warnings;

use Test::More;
use Test::Exception;
use PDT::Server::Test;
use Data::Dumper;

dbinit();

my $CLASS = 'PDT::Server::Plugin';
use_ok( $CLASS );

can_ok( $CLASS, qw/host_plugins requests name id/ );

ok( my $one = $CLASS->new( id => 1001 ), "Get one" );

is_deeply(
    $one,
    {
        id => 1001,
        name => 'Git'
    },
    "Got one"
);

done_testing();

