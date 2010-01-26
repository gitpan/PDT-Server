package PDT::Server::Answer;
use strict;
use warnings;
use PDT::Server::Schema;
use Fey::ORM::Table;

my $schema = PDT::Server::Schema->Schema();
has_table $schema->table('answer');

# Because relationships are 2-way each class needs the other in order to
# establish the relationship. As such it should require the relationship
# classes *AFTER* has_table().
require PDT::Server::Request;
require PDT::Server::Host;

has_one request => ( table => $schema->table('request'));
has_one host => ( table => $schema->table('host'));

1;
