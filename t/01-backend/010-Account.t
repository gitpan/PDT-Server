#!/usr/bin/perl
use strict;
use warnings;

use Test::More;
use PDT::Server::Test;
use Digest::SHA qw/sha512_hex/;
use Data::Dumper;
use Carp;

my $CLASS = 'PDT::Server::Account';
use_ok( $CLASS );

can_ok( $CLASS, qw/ id email password registration / );

ok(my $one = $CLASS->insert(
    email => 'test@example.com',
    password => 'A 190 Pretty GoOd! pAssw0rd&*',
    login => 'test',
    full_name => 'test',
), "Create instance");

isa_ok( $one, $CLASS );

ok( $one = $CLASS->new( id => $one->id ), "retrieve object");

is( $one->password, sha512_hex( 'A 190 Pretty GoOd! pAssw0rd&*' ), "Set password" );
ok( $one->verify_password( 'A 190 Pretty GoOd! pAssw0rd&*' ), "Verified password" );

dbinit();

is_deeply(
    $CLASS->new( id => 1001 ),
    {
        email       => 'acct1@example.com',
        password    => sha512_hex('password'),
        id  => '1001',
        registration => '2010-01-15 00:00:00',
        login => 'acct1',
        verification => undef,
        full_name => 'acct one',
    },
    "Fetch 1001 from dataset"
);

is_deeply(
    $CLASS->new( id => 1002 ),
    {
        email       => 'acct2@example.com',
        password    => sha512_hex('password'),
        id  => '1002',
        registration => '2010-01-16 00:00:00',
        login => 'acct2',
        verification => undef,
        full_name => 'acct two',
    },
    "Fetch 1002 from dataset"
);

done_testing();
