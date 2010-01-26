#!/usr/bin/perl
use strict;
use warnings;

use Test::More;
use Test::Exception;
use PDT::Server::Test;
use Data::Dumper;

dbinit();

my $CLASS = 'PDT::Server::Operatingsystem';
use_ok( $CLASS );

can_ok( $CLASS, qw/hosts requests name distribution version/ );

ok( my $one = $CLASS->new( id => 1001 ), "Get One");

is_deeply(
    $one,
    {
        id => 1001,
        name => 'GNU-Linux',
        distribution => 'Gentoo',
        version => 10.1,
    },
    "Got one"
);

done_testing();
