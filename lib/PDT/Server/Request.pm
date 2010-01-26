package PDT::Server::Request;
use strict;
use warnings;
use PDT::Server::Schema;
use Fey::ORM::Table;

my $schema = PDT::Server::Schema->Schema();
has_table $schema->table('request');

# Because relationships are 2-way each class needs the other in order to
# establish the relationship. As such it should require the relationship
# classes *AFTER* has_table().
require PDT::Server::Host;
require PDT::Server::Plugin;
require PDT::Server::Architecture;
require PDT::Server::Operatingsystem;

has_one host => ( table => $schema->table( 'host' ));
has_one plugin => ( table => $schema->table( 'plugin' ));
has_one architecture => ( table => $schema->table( 'architecture' ));
has_one operatingsystem => ( table => $schema->table( 'operatingsystem' ));

1;
