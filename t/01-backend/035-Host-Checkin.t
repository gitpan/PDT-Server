#!/usr/bin/perl
use strict;
use warnings;

use Test::More;
use Test::Exception;
use PDT::Server::Test;
use Data::Dumper;

dbinit();

my $CLASS = 'PDT::Server::Host::Checkin';
use_ok( $CLASS );

can_ok( $CLASS, qw/host event/ );

ok( my $one = $CLASS->new( id => 1001 ), "Get one" );

is_deeply(
    $one,
    {
        host_id => 1001,
        id => 1001,
        event => '2010-01-16 01:00:00'
    },
    "Got one"
);

done_testing();

__END__

