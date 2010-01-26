#!/usr/bin/perl
use strict;
use warnings;

use Test::More;
use PDT::Server::Test;
use Carp;

dbinit();

my $CLASS = 'PDT::Server::Host';
use_ok( $CLASS );

can_ok( $CLASS, qw/ architecture operatingsystem host_plugins account registration/ );

ok( my $one = $CLASS->new( id => 1001 ), "Get one" );

is_deeply(
    $one,
    {
        id => 1001,
        architecture_id => 1001,
        operatingsystem_id => 1001,
        account_id => 1001,
        registration => '2010-01-01 00:00:00',
        hostname => 'Xellos',
    },
    "Got one"
);

done_testing();
