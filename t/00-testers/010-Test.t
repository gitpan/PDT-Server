#!/usr/bin/perl
use strict;
use warnings;

use Test::More;
use Test::Exception;

my $CLASS = 'PDT::Server::Test';
use_ok( $CLASS, '-transaction', '-dbinit' );
is_deeply(
    $PDT::Server::Test::FIRSTCALLER,
    [
        __PACKAGE__,
        # This isn't predictable:
        $PDT::Server::Test::FIRSTCALLER->[1],
        $PDT::Server::Test::FIRSTCALLER->[2],
    ],
    "First Caller"
);

ok( ! $PDT::Server::Test::TRANSACTION, "No transaction" );
ok( $PDT::Server::Test::NO_TRANSACTION, "No transaction" );
ok( ! __PACKAGE__->can( 'dbinit' ), "dbinit not imported" );

$CLASS->import;
ok( __PACKAGE__->can( 'dbinit' ), "dbinit imported" );
ok( ! $PDT::Server::Test::TRANSACTION, "No transaction" );
ok( $PDT::Server::Test::NO_TRANSACTION, "No transaction" );
is_deeply(
    $PDT::Server::Test::FIRSTCALLER,
    [
        __PACKAGE__,
        # This isn't predictable:
        $PDT::Server::Test::FIRSTCALLER->[1],
        $PDT::Server::Test::FIRSTCALLER->[2],
    ],
    "First Caller"
);

undef( *dbinit );
ok( ! __PACKAGE__->can( 'dbinit' ), "dbinit gone" );

$PDT::Server::Test::TRANSACTION = undef;
$PDT::Server::Test::NO_TRANSACTION = undef;
$PDT::Server::Test::FIRSTCALLER = undef;
ok( !$PDT::Server::Test::TRANSACTION, "No transaction" );
ok( !$PDT::Server::Test::NO_TRANSACTION, "reset no-transaction" );
ok( !$PDT::Server::Test::FIRSTCALLER, "Reset first caller" );

$CLASS->import();
ok( __PACKAGE__->can( 'dbinit' ), "dbinit imported" );
ok( $PDT::Server::Test::TRANSACTION, "transaction" );
ok( !$PDT::Server::Test::NO_TRANSACTION, "transaction" );
is_deeply(
    $PDT::Server::Test::FIRSTCALLER,
    [
        __PACKAGE__,
        __FILE__,
        50
    ],
    "First Caller"
);

lives_ok { $CLASS->import } "No problem using class again";
dies_ok { $CLASS->import( '-transaction' ) } "Already started a transaction";
my $msg = $@;
my $package = __PACKAGE__;
my $file = __FILE__;
like(
    $msg,
    qr/flag '-transaction' specified, but transaction was already started/,
    "Message"
);
like(
    $msg,
    qr/Transaction started by:/,
    "Message"
);
like(
    $msg,
    qr/package: $package/,
    "Package is in message"
);
like(
    $msg,
    qr/filename: $file/,
    "File in message"
);
like(
    $msg,
    qr/line: 50/,
    "Line is in message"
);

done_testing();
