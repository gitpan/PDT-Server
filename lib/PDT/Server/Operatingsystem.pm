package PDT::Server::Operatingsystem;
use strict;
use warnings;
use PDT::Server::Schema;
use Fey::ORM::Table;

my $schema = PDT::Server::Schema->Schema();
has_table $schema->table('operatingsystem');

# Because relationships are 2-way each class needs the other in order to
# establish the relationship. As such it should require the relationship
# classes *AFTER* has_table().
require PDT::Server::Host;
require PDT::Server::Request;

has_many hosts => ( table => $schema->table( 'host' ));
has_many requests => ( table => $schema->table( 'request' ));

1;
__END__
