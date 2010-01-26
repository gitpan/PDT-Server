package PDT::Server::Controller::Login;
use Moose;
use namespace::autoclean;
use PDT::Server::Validator qw/validate/;

BEGIN {extends 'Catalyst::Controller'; }

=head1 NAME

PDT::Server::Controller::Login - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut

sub fields {
    [
        {
            -name => 'Login',
            -fields => [ qw/ login password / ],
            password => { type => 'password', label => 'Password' },
        },
    ]
}

=head2 index

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    my $validator = validate( $c->request->params );

    return if $validator->got_args
           && !$validator->errors
           && $self->login( $c, $validator );

    $c->stash->{session} = $c->session;
    $c->stash->{title} = 'Login';
    $c->stash->{template} = "simple.html";
    $c->stash->{values} = $validator;
    $c->stash->{fields} = $self->fields;
}

sub login {
    my ( $self, $c, $validator ) = @_;

    my $account = PDT::Server::Account->new( login => $validator->value( 'login' ));
    $validator->errors( "Invalid account or password." )
        unless $account
           and $account->id
           and $account->verify_password( $validator->value( 'password' ));

    return if $validator->errors;

    $c->session->{ logged_in } = $account->id;
    $c->stash->{session} = $c->session;
    $c->stash->{title} = 'Welcome!';
    $c->stash->{template} = "simple.html";
    $c->stash->{values} = $validator;
    $c->stash->{content} = 'You have been logged in.';

    return 1;
}

=head1 AUTHOR

A clever guy

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

