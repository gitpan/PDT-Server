#!/usr/bin/perl
use strict;
use warnings;

use Test::More;
use Test::Exception;
use PDT::Server::Test;
use Data::Dumper;

dbinit();

my $CLASS = 'PDT::Server::Request';
use_ok( $CLASS );

can_ok( $CLASS, qw/host plugin architecture operatingsystem/ );

ok( my $one = $CLASS->new( id => 1001 ), "Get one" );

is_deeply(
    $one,
    {
        id  => '1001',
        issued  => '2010-01-17 05:00:00',
        assigned    => '1001',
        source_uri  => 'test://1001',
        plugin_id   => '1007',
        architecture_id => '1001',
        operatingsystem_id  => '1001',
        account_id => 1001,
    },
    "Got one"
);

done_testing();
