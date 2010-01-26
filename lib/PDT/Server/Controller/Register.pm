package PDT::Server::Controller::Register;
use Moose;
use namespace::autoclean;
use PDT::Server::Validator qw/validate/;
use PDT::Server::Account;
use Digest::SHA qw/sha512_hex/;

BEGIN {extends 'Catalyst::Controller'; }

=head1 NAME

PDT::Server::Controller::Register - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut

sub fields {
    [
        {
            -name => 'Account Info',
            -fields => [ qw/ login full_name email password1 password2 captcha / ],
            email => [ 'text', "email" ],
            password1 => { type => 'password', label => 'Password' },
            password2 => { type => 'password', label => 'Confirm Password' },
            captcha => 'captcha',
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
           && $self->create_account( $c, $validator );

    $c->stash->{session} = $c->session;
    $c->stash->{title} = 'Register an account';
    $c->stash->{template} = "simple.html";
    $c->stash->{content_path} = 'register/info.html';
    $c->stash->{values} = $validator;
    $c->stash->{fields} = $self->fields;
}

sub confirm :Path( 'confirm' ) :Args(1) {
    my ( $self, $c, $code ) = @_;

    my $account = PDT::Server::Account->new( verification => $code );
    unless ( $account and $account->id ) {
        $c->response->body( "Not a valid code." );
        return;
    }
    $account->update( verification => undef );

    $c->stash->{session} = $c->session;
    $c->stash->{title} = 'Account Confirmed';
    $c->stash->{template} = "simple.html";
    $c->stash->{content_path} = 'register/confirmed.html';
}

sub create_account {
    my ( $self, $c, $validator ) = @_;

    #captcha
    $validator->errors( "Captcha text didn't match. Please try again." )
        unless ( $validator->value( 'captcha' ) eq $c->session->{ captcha });

    #password match
    $validator->errors( "Passwords must match" )
        unless ( $validator->value( 'password1' ) eq $validator->value( 'password2' ));

    #existing
    for my $field ( qw/login email/ ) {
        my $val = $validator->value( $field );
        if ( my $existing = PDT::Server::Account->new( $field => $val )) {
            if ( $existing->verified ) {
                $validator->errors( "$field '$val' already exists" )
            }
            else {
                $validator->errors( "$field '$val' already exists, but has not yet been verified." )
            }
        }
    }

    return 0 if $validator->errors;

    # Random unique string.
    my $verification;
    do {
        $verification = sha512_hex( join( rand(10),
            rand(10000),
            values %{ $validator->values },
            values %{ $c->session },
            $self,
            $c,
            rand(10000),
        )),
    } until( ! PDT::Server::Account->new( verification => $verification ));

    my $new = PDT::Server::Account->insert(
        verification => $verification,
        password => $validator->value( 'password1' ),
        map { $_ => $validator->value( $_ )} qw/ email login full_name /
    );

    #Send email
    warn( "Email sending not implemented, account verification key: $verification" );

    $c->stash->{session} = $c->session;
    $c->stash->{title} = 'Account Created';
    $c->stash->{template} = "simple.html";
    $c->stash->{content_path} = 'register/success.html';
    return 1;
}


=head1 AUTHOR

A clever guy

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

