package PDT::Server::Validator;
use strict;
use warnings;
use Carp;
use Moose;
use MooseX::Types::Moose qw/ArrayRef HashRef/;
use Module::Pluggable search_path => [ 'PDT::Server::Validator' ], require => 1;

our %VALIDATORS;

#{{{ POD

=pod

=head1 NAME

PDT::Server::Validator - PDT form field validator

=head1 *EARLY STAGE WARNING*

This module is currently in the early stages. For the latest please check the
github page at L<http://github.com/exodist/PDT>

=head1 DESCRIPTION

This is the validator used to validate form input from html forms. This is
heavily influenced by L<CGI::ValidOp>. I have adopted what I like from
L<CGI::ValidOp>, but have modified it to better suit my workflow.

=head1 CONTROLLER SYNOPSYS

    package My::Controller;
    use strict;
    use warnings;

    # Use the validator and bring int he shortcut function.
    use PDT::Server::Validator qw/validate/;

    sub fields {
        [
            {
                # Name this set (optional)
                -name => 'field-set name',

                # Make this field set optional contingent on the value of
                # 'field_name', if bool is true then this set is only required
                # when 'field_name' is true. When bool is false this set is
                # only required when 'field_name' is false.
                -optional => [ field_name, bool ],

                # Define fields in 1 of 3 ways

                # Basic, type is the html form input type
                name => type,

                # Basic with a premade validator or a codref validator
                name => [ type, (validator || sub {}) ],

                # Complete
                name => {
                    type => type,
                    validation => (validator || sub ),
                    label => label,
                },
            },
            { ... },
        ]
    }

    # Using shortcut
    sub do_stuff_a {
        my $self = shift;
        my %params = @_;
        my $validator = validate( \%params );

        # Check for errors, warn for each
        warn $_ for @{ $validator->errors } if $validator->errors;

        $self->save( $validator->values );

        # Get value of param 'a' only if it passed validation
        print $validator->value( 'a' );

        # Get value of param 'a' even if it failed validation
        print $validation->unsafe( 'a' );
    }

    # no shortcut
    sub do_dtuff_b {
        my $self = shift;
        my %params = @_;

        my $validator = PDT::Server::Validator->new( fields => $self->fields, args => \%params );
        my $no_errors = $valdiator->validate();

        # Check for errors, warn for each
        warn $_ for @{ $validator->errors } if $validator->errors;

        $self->save( $validator->values );

        # Get value of param 'a' only if it passed validation
        print $validator->value( 'a' );

        # Get value of param 'a' even if it failed validation
        print $validation->unsafe( 'a' );
    }

=head1 PLUGIN SYNOPSYS

Plugins should use the validator and import add_validator(). add_validator()
takes a validator name, and a coderef. The coderef should accept a single value
as an argument. The coderef should return true when valid, false and an error
message when not valid.

    package PDT::Server::Validator::Basic;
    use strict;
    use warnings;

    use PDT::Server::Validator qw/add_validator/;

    add_validator integer => sub {
        my ( $value ) = @_;
        return 1 if $value =~ m/^\d+$/;
        return ( 0, "'$value' is not an integer" );
    };

    1;

=head1 CLASS METHODS

=over 4

=item $class->import()

=item $class->import( qw/validate/ )

=item $class->import( qw/add_validator/ )

=item $class->import( qw/validate add_validator/ )

Called automatically by use. Exports helper/shortcut functions to the current
package. Nothing special here.

=item $class->new( args => {}, fields => [{},{},...] )

Create a new instance. args shoudl be a hash of field => value to be validated.
Fields should be a field defenition like that in the synopsys.

=cut

#}}}

sub import {
    my $class = shift;
    my ( $caller ) = caller;

    if ( grep { $_ eq 'validate' } @_ ) {
        no strict 'refs';
        *{ $caller . '::validate' } = sub {
            my $self = $class->new( fields => $caller->fields, args => $_[0] );
            $self->validate;
            return $self;
        };
    }
    if ( grep { $_ eq 'add_validator' } @_ ) {
        no strict 'refs';
        *{ $caller . '::add_validator' } = sub {
            my ( $name, $sub ) = @_;

            croak( "add_validator takes a name and a coderef" )
                unless $name and ref $sub and ref $sub eq 'CODE';

            croak( "Validation '$name' already exists" )
                if $VALIDATORS{ $name };

            $VALIDATORS{ $name } = $sub;
        };
    }
}

=item $class->validator( $name )

Get the validator coderef for the given name.

=cut

sub validator {
    shift;
    my ( $v ) = @_;
    return $v if ref $v and ref $v eq 'CODE';
    return $VALIDATORS{ $v };
}

=back

=head1 OBJECT METHODS

=over 4

=item $obj->args()

Get the argument hash provided at construction.

=cut

has args => (
    is => 'ro',
    isa => HashRef,
    default => sub {{}},
    lazy => 1,
);

sub got_args {
    my $self = shift;
    return !! keys %{ $self->args };
}

=item $obj->fields()

Get the field defenitions provided at construction.

=cut

has fields => (
    is => 'ro',
    isa => ArrayRef,
    default => sub {[]},
    lazy => 1,
);

=item $obj->values()

Get the hash of validated field values.

=cut

has values => (
    is => 'rw',
    isa => HashRef,
    default => sub {{}},
    lazy => 1,
);

=item $errors = $obj->errors()

=item $obj->errors( 'error1', 'error2' )

Add errors, retrieve errors, check for errors.

=cut

sub errors {
    my $self = shift;
    push @{ $self->_errors } => @_ if ( @_ );
    return unless @{ $self->_errors };
    return $self->_errors;
}

=item $obj->value( $param )

=item $obj->value( $param, $value );

Used to get/set a value after validation.

I don't recommend changing a value manually.

=cut

sub value {
    my $self = shift;
    my $param = shift;
    return unless $param;

    ($self->values->{ $param }) = @_ if @_;
    return $self->values->{ $param };
}

=item $val = $obj->unsafe( $param )

Get the value of the parameter, even if it does not validate.

=cut

sub unsafe {
    my $self = shift;
    my ( $param ) = @_;
    return unless $param;

    return $self->value( $param ) || $self->args->{ $param };
}

has _errors => (
    is => 'rw',
    isa => ArrayRef,
    default => sub {[]},
    lazy => 1,
);

sub _set_disabled {
    my $self = shift;
    my ( $set ) = @_;

    return unless $set->{ -optional };

    my ( $name, $want ) = @{ $set->{-optional}};
    # Match, want true, have true
    return 0 if $want && $self->args->{ $name };
    # Don't match, at least one is true, but not both
    return 1 if $want || $self->args->{ $name };
    # Both false, were good
    return 0;
}

sub _validate_field {
    my $self = shift;
    my ( $field, $spec ) = @_;

    # Normalize the spec
    $spec = { label => $field, type => $spec->[0], validation => $spec->[1] }
        if ref $spec and ref $spec eq 'ARRAY';
    $spec = { label => $field, type => $spec }
        unless ref $spec;

    my @errors;
    if ( my $validators = $spec->{ validation } ) {
        $validators = [ $validators ] unless ref $validators
                                      and ref $validators eq 'ARRAY';

        for my $vsub ( map { $self->validator( $_ ) } @$validators ) {
            my ( $ret, $msg ) = $vsub->( $self->args->{ $field });

            push @errors => $spec->{ label } . ": $msg"
                unless $ret
        }
    }

    return @errors;
}

=item $bool = $obj->validate()

Run the validation checks. Make validated values available and record errors.

=cut

sub validate {
    my $self = shift;
    $self->values( {} );
    $self->_errors( [] );
    return 1 unless $self->got_args;

    for my $set ( @{ $self->fields }) {
        # Don't validate sets that are disabled.
        next if $self->_set_disabled( $set );

        for my $field ( @{ $set->{ -fields }}) {
            my $spec = $set->{ $field } || 'text';

            my @errors = $self->_validate_field( $field, $spec );

            push @errors => "$field: No value provided"
                unless( defined $self->args->{ $field } );

            if ( @errors ) {
                $self->errors( @errors );
            }
            else {
                $self->value( $field, $self->args->{ $field });
            }
        }
    }

    return !$self->errors;
}

# Make sure the plugins are loaded now instead of later.
__PACKAGE__->plugins;

1;

__END__

=back

=head1 AUTHORS

Chad Granum L<exodist7@gmail.com>

=head1 COPYRIGHT

Copyright (C) 2010 Chad Granum

PDT is free software; Standard perl licence.

PDT is distributed in the hope that it will be useful, but WITHOUT
ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
FOR A PARTICULAR PURPOSE.  See the license for more details.
