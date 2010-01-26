package PDT::Server::Account;
use strict;
use warnings;
use PDT::Server::Schema;
use Fey::ORM::Table;
use Digest::SHA qw/sha512_hex/;
use Carp;

my $schema = PDT::Server::Schema->Schema();
has_table $schema->table('account');

# Because relationships are 2-way each class needs the other in order to
# establish the relationship. As such it should require the relationship
# classes *AFTER* has_table().
require PDT::Server::Host;
require PDT::Server::Request;

has_many hosts => ( table => $schema->table('host'));
has_many requests => ( table => $schema->table('request'));

transform 'password' => deflate {
    my $self = shift;
    my ($password) = @_;
    return undef unless $password;
    return sha512_hex( $password );
};

sub verify_password {
    my $self = shift;
    my ( $password ) = @_;
    my $hash = sha512_hex( $password );
    return $hash eq $self->password ? 1 : 0;
}

sub verified {
    my $self = shift;
    return !$self->verification;
}

1;
