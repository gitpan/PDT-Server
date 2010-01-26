#!/usr/bin/perl
use strict;
use warnings;

use Test::More;
use Test::Exception;
use PDT::Server::Test;
use Data::Dumper;

dbinit();

my $CLASS = 'PDT::Server::Answer';
use_ok( $CLASS );

can_ok( $CLASS, qw/host request/ );

ok( my $one = $CLASS->new( id => 1001 ), "Get one" );

is_deeply(
    $one,
    {
        id  => '1001',
        host_id => '1001',
        data    => 'Error: 12345',
        success => '0',
        request_id  => '1001',
        received    => '2010-01-17 05:30:00',
    },
    "Got one"
);

done_testing();

__END__

