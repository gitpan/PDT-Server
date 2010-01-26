package PDT::Server::Controller::Captcha;
use Moose;
use namespace::autoclean;
use GD::SecurityImage;

BEGIN {extends 'Catalyst::Controller'; }

=head1 NAME

PDT::Server::Controller::Captcha - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    my $image = GD::SecurityImage->new(
        width   => 80,
        height  => 30,
        lines   => 6,
        gd_font => 'giant',
    );
    $image->random();
    $image->create( normal => 'rect' );
    my ( $image_data, $mime_type, $random_number ) = $image->out;
    $c->session->{ captcha } = $random_number;

    $c->response->content_type( $mime_type );
    $c->response->body( $image_data );
}


=head1 AUTHOR

A clever guy

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

