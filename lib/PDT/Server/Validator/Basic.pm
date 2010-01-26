package PDT::Server::Validator::Basic;
use strict;
use warnings;

use PDT::Server::Validator qw/add_validator/;

add_validator integer => sub {
    my ( $value ) = @_;
    return 1 if $value =~ m/^\d+$/;
    return ( 0, "'$value' is not an integer" );
};

# Just make sure it looks liek an email address, don't try too hard.
add_validator email => sub {
    my ( $value ) = @_;
    return 1 if $value =~ m/^[^\@]+\@[^\@]+\.[^\@]+$/;
    return ( 0, "$value doesn't look like an email address" );
};

1;
