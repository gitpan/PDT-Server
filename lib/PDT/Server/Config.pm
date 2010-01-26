package PDT::Server::Config;
use strict;
use warnings;
use base 'PDT::Config';

our $SINGLETON;

sub defaults {{
    dbtype => 'dbi:Pg',
    dbname => $ENV{ PDT_TEST_DBNAME },
    dbpass => $ENV{ PDT_TEST_DBPASS },
    dbuser => $ENV{ PDT_TEST_DBUSER },
}}
sub configs {[ $ENV{ 'PDT_SERVER_CONFIG' } || 'server.yaml', '/etc/pdt/server.yaml', $ENV{ HOME } . '/pdt/server.yaml' ]}
sub params {[qw/ dbname dbpass dbuser dbtype /]}

sub new {
    my $class = shift;
    $SINGLETON ||= $class->SUPER::new( @_ );
    return $SINGLETON;
}

__PACKAGE__->subclass();

1;
