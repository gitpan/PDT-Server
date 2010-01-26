#!/usr/bin/perl
use strict;
use warnings;

use Test::More;
use Data::Dumper;
use PDT::Server::Test qw/-transaction/;
use PDT::Server::Util::Transactions;
use PDT::Server::Account;

my $CLASS = 'PDT::Server::Test::Data';
use_ok( $CLASS );

ok( my $one = $CLASS->new(), "init");
isa_ok( $one, $CLASS );

is( $one->data_set, 'base', 'data set' );
is( $one->data_dir, 't/testdata/base', "data dir" );

ok(( grep { m/account\.yaml/ } @{ $one->fixtures }), "Account fixture" );
ok( !in_transaction(), "Not in a transaction" );

$one->setup();
ok( in_transaction(), "In a transaction" );

ok( my $tmp = PDT::Server::Account->new( id => 1001 ), "Loaded Account 1001");

is_deeply(
    $tmp,
    {
        email => 'acct1@example.com',
        password => 'b109f3bbbc244eb82441917ed06d618b9008dd09b3befd1b5e07394c706a8bb980b1d7785e5976ec049b46df5f1326af5a2ea6d103fd07c95385ffab0cacbc86',
        id => 1001,
        registration => '2010-01-15 00:00:00',
        login => 'acct1',
        verification => undef,
        full_name => 'acct one',
    },
    "Account loaded properly"
);

$one->clear;
ok( !in_transaction(), "Transaction ended" );
ok( !PDT::Server::Account->new( id => 1001 ), "Account 1001 removed");

done_testing();
