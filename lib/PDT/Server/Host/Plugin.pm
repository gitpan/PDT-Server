package PDT::Server::Host::Plugin;
use strict;
use warnings;
use PDT::Server::Schema;
use Fey::ORM::Table;

my $schema = PDT::Server::Schema->Schema();
has_table $schema->table('host_plugin');

# Because relationships are 2-way each class needs the other in order to
# establish the relationship. As such it should require the relationship
# classes *AFTER* has_table().
require PDT::Server::Host;
require PDT::Server::Plugin;

has_one host => ( table => $schema->table( 'host' ));
has_one plugin => ( table => $schema->table( 'plugin' ));

1;
__END__
