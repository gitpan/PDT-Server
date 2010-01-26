#!/usr/bin/perl
use strict;
use warnings;

use Test::More;
use Test::Exception;
use PDT::Server::Test qw/-transaction/;

my $CLASS = 'PDT::Server::Util::Transactions';
use_ok( $CLASS );

can_ok( __PACKAGE__, qw/start_transaction rollback_transaction commit_transaction transaction_do/ );

ok( $CLASS->dbh, "Got dbh" );
is( $CLASS->__autoname, 'AAAAAAAA', "autoname" );
is_deeply( $CLASS->transactions, [], "No transactions" );

is( $CLASS->_autoname, "AAAAAAAB_$$", "autoname incriments" );
is( $CLASS->_autoname, "AAAAAAAC_$$", "autoname incriments" );

ok( $CLASS->dbh->{ AutoCommit }, "Not in a transaction yet" );
my $name = start_transaction();
ok( !$CLASS->dbh->{ AutoCommit }, "In a transaction" );
is_deeply( $CLASS->transactions, [ $name ], "Transaction" );

$CLASS->dbh->do( "CREATE TABLE XXX( id serial primary key, name text )" );
my $sth = $CLASS->dbh->prepare( 'INSERT INTO XXX( name ) VALUES( ? )' );
lives_ok { $sth->execute( 'bob' ) } "Insert into new table";

rollback_transaction( $name );
ok( $CLASS->dbh->{ AutoCommit }, "Not in a transaction" );
is_deeply( $CLASS->transactions, [], "No transactions" );
dies_ok { $sth->execute( 'fred' ) } "Table rolled back";

$name = start_transaction();
ok( !$CLASS->dbh->{ AutoCommit }, "In a transaction" );
is_deeply( $CLASS->transactions, [ $name ], "Transaction" );

$CLASS->dbh->do( "CREATE TABLE XXX( id serial primary key, name text )" );
$sth = $CLASS->dbh->prepare( 'INSERT INTO XXX( name ) VALUES( ? )' );
lives_ok { $sth->execute( 'bob' ) } "Insert into new table";

my $name2 = start_transaction();
ok( !$CLASS->dbh->{ AutoCommit }, "In a transaction" );
is_deeply( $CLASS->transactions, [ $name, $name2 ], "2 Transactions" );

$CLASS->dbh->do( "CREATE TABLE YYY( id serial primary key, name text )" );
$sth = $CLASS->dbh->prepare( 'INSERT INTO YYY( name ) VALUES( ? )' );
lives_ok { $sth->execute( 'bob' ) } "Insert into new table";

rollback_transaction( $name2 );
ok( !$CLASS->dbh->{ AutoCommit }, "In a transaction" );
is_deeply( $CLASS->transactions, [ $name ], "Transaction" );
$sth = $CLASS->dbh->prepare( 'INSERT INTO XXX( name ) VALUES( ? )' );
lives_ok { $sth->execute( 'bob' ) } "Insert into new table";
$sth = $CLASS->dbh->prepare( 'INSERT INTO YYY( name ) VALUES( ? )' );
dies_ok { $sth->execute( 'fred' ) } "Table rolled back";

rollback_transaction( $name );
$sth = $CLASS->dbh->prepare( 'INSERT INTO XXX( name ) VALUES( ? )' );
dies_ok { $sth->execute( 'fred' ) } "Table rolled back";

done_testing();

__END__
