#!/usr/bin/perl
use strict;
use warnings;

use Test::More;
use Test::Exception;
use PDT::Server::Test;
use Data::Dumper;

dbinit();

my $CLASS = 'PDT::Server::Host::Plugin';
use_ok( $CLASS );

can_ok( $CLASS, qw/host plugin/ );

ok( my $one = $CLASS->new( id => 1001 ), "Get one" );

is_deeply(
    $one,
    {
        id => 1001,
        host_id => 1001,
        plugin_id => 1007,
    },
    "Got one"
);

done_testing();

__END__

