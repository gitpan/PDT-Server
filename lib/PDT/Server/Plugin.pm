package PDT::Server::Plugin;
use strict;
use warnings;
use PDT::Server::Schema;
use Fey::ORM::Table;

my $schema = PDT::Server::Schema->Schema();
has_table $schema->table('plugin');

# Because relationships are 2-way each class needs the other in order to
# establish the relationship. As such it should require the relationship
# classes *AFTER* has_table().
require PDT::Server::Request;
require PDT::Server::Host::Plugin;

has_many host_plugins => ( table => $schema->table( 'host_plugin' ));
has_many requests => ( table => $schema->table( 'request' ));

1;
__END__
