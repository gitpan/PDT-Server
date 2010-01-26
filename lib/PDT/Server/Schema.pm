package PDT::Server::Schema;
use strict;
use warnings;
use Carp;

use PDT::Server::Config;
use Fey::DBIManager::Source;
use Fey::Loader;
use Fey::ORM::Schema;
use MooseX::ClassAttribute;

class_has source => (
    isa => 'Fey::DBIManager::Source',
    is => 'ro',
    default => sub {
        my $config = PDT::Server::Config->new;
        croak( "You must specify both dbtype and dbname in the config." )
            unless $config->dbtype && $config->dbname;
        Fey::DBIManager::Source->new(
            dsn  => $config->dbtype . ':dbname=' . $config->dbname,
            username => $config->dbuser || "",
            password => $config->dbpass || "",
        );
    },
);

my $source = __PACKAGE__->source;
my $schema = Fey::Loader->new( dbh => $source->dbh() )->make_schema();

has_schema $schema;

__PACKAGE__->DBIManager()->add_source($source);

1;

__END__
