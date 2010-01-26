package PDT::Server::View::Mason;

use strict;
use warnings;

use parent 'Catalyst::View::Mason';

__PACKAGE__->config(
    use_match => 0,
    template_extension => '.html',
    allow_globals => [qw/$c $base $name/],
);

=head1 NAME

PDT::Server::View::Mason - Mason View Component for PDT::Server

=head1 DESCRIPTION

Mason View Component for PDT::Server

=head1 SEE ALSO

L<PDT::Server>, L<HTML::Mason>

=head1 AUTHOR

A clever guy
A clever guy
A clever guy
A clever guy

=head1 LICENSE

This library is free software . You can redistribute it and/or modify it under
the same terms as perl itself.

=cut

1;
