package PDT::Server::Host;
use strict;
use warnings;
use PDT::Server::Schema;
use Fey::ORM::Table;
use MooseX::Types::Moose qw(ArrayRef);

my $schema = PDT::Server::Schema->Schema();
has_table $schema->table('host');

# Because relationships are 2-way each class needs the other in order to
# establish the relationship. As such it should require the relationship
# classes *AFTER* has_table().
require PDT::Server::Architecture;
require PDT::Server::Operatingsystem;
require PDT::Server::Host::Plugin;
require PDT::Server::Host::Checkin;
require PDT::Server::Account;

has_one architecture => ( table => $schema->table( 'architecture' ));
has_one operatingsystem => ( table => $schema->table( 'operatingsystem' ));
has_many host_plugins => ( table => $schema->table( 'host_plugin' ));
has_many host_checkins => ( table => $schema->table( 'host_checkin' ));
has_one account => ( table => $schema->table( 'account' ));

1;
