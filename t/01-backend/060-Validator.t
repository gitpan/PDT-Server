#!/usr/bin/perl
use strict;
use warnings;

use Test::More;

my $CLASS = 'PDT::Server::Validator';
use_ok( $CLASS );

#{{{ Plugins
ok( $INC{ 'PDT/Server/Validator/Basic.pm' }, "Loaded basic plugin" );
is_deeply(
    [ sort grep { m/^(integer|email)$/ } keys %PDT::Server::Validator::VALIDATORS ],
    [ qw/ email integer / ],
    "Found the 2 basic validators we saught."
);
#}}}

# Token, we trust moose, but lets be sure we don't remove the defenitions.
can_ok( $CLASS, qw/_errors args fields values / );

#{{{ Validator
is( $CLASS->validator( 'integer' ), $PDT::Server::Validator::VALIDATORS{ 'integer' }, "Got integer validator" );
is( $CLASS->validator( 'email' ), $PDT::Server::Validator::VALIDATORS{ 'email' }, "Got email validator" );
my $tmp = sub { 1 };
is( $CLASS->validator( $tmp ), $tmp, "Validator passes back a sub" );
#}}}

my $one = $CLASS->new;
#{{{ errors
ok( ! $one->errors, "No errors yet" );
ok( $one->errors( 'a' .. 'c' ), "Add an error" );
is_deeply( $one->errors, [ 'a' .. 'c' ], "Correct Errors" );
ok( $one->errors, "Got errors" );
#}}}

#{{{ values
ok( ! $one->value, "No param to value" );
ok( ! $one->value( 'a' ), "No value" );
ok( $one->value( 'a', 'a' ), "Set value" );
is( $one->value( 'a' ), 'a', "Got value" );
#}}}

#{{{ unsafe
ok( ! $one->unsafe, "No param to value" );
ok( ! $one->unsafe( 'b' ), "No value" );
is( $one->unsafe( 'a' ), 'a', "Got value from values" );
$one->args->{ b } = 'b';
is( $one->unsafe( 'b' ), 'b', "Got value from unfiltered args" );
#}}}

#{{{ Data
$one = $CLASS->new(
    fields => [
        {
            -name => 'primary',
            -fields => [ map { "field_$_" } 'a' .. 'f' ],
            field_a => 'text',
            field_b => [ 'text', 'integer' ],
            field_c => [ 'text', sub { return 0, "fail" } ],
            field_d => [ 'text', sub { 1 }],
            field_e => [ 'text' ],
            field_f => { type => 'text', validation => 'integer', label => 'Field F' }
        },
        {
            -name => "disabled_1",
            -optional => [ 'field_a', 1 ],
            -fields => [ 'field_x' ],

            # This will not produce an error since this set is disabled.
            field_x => [ 'text', sub { return 0, "fail" } ],
        },
        {
            -name => "enabled_1",
            -optional => [ 'field_a', 0 ],
        },
        {
            -name => "disabled_2",
            -optional => [ 'field_b', 1 ],
        },
        {
            -name => "enabled_2",
            -optional => [ 'field_b', 0 ],
        }
    ],
    args => {
        field_a => 0,
        field_b => 1,
        field_c => 'x',
        field_d => 'x',
        field_e => 'x',
        field_f => 'x',
    }
);
#}}}

#{{{ Disabled sets
ok( !$one->_set_disabled( $one->fields->[0] ), "First set not disabled" );
ok( $one->_set_disabled( $one->fields->[1] ), "Second set is disabled" );
ok( !$one->_set_disabled( $one->fields->[2] ), "Third set is not disabled" );
ok( !$one->_set_disabled( $one->fields->[3] ), "Fourth set is not disabled" );
ok( $one->_set_disabled( $one->fields->[4] ), "Fith set is disabled" );
#}}}

#{{{ Field Validation
ok( !$one->_validate_field( 'field_a', $one->fields->[0]->{ field_a } ), "No errors for field_a");
ok( !$one->_validate_field( 'field_b', $one->fields->[0]->{ field_b } ), "No errors for field_b");
is_deeply(
    [ $one->_validate_field( 'field_c', $one->fields->[0]->{ field_c } )],
    [ 'field_c: fail' ],
    "Got error for field_c"
);
ok( !$one->_validate_field( 'field_d', $one->fields->[0]->{ field_d } ), "No errors for field_d");
ok( !$one->_validate_field( 'field_e', $one->fields->[0]->{ field_e } ), "No errors for field_e");
is_deeply(
    [ $one->_validate_field( 'field_f', $one->fields->[0]->{ field_f } )],
    [ 'Field F: \'x\' is not an integer' ],
    "Got error for field_f"
);
#}}}

#{{{ Validate
ok( $one->got_args, "Got args" );
ok( ! $one->errors, "No errors yet" );
ok( !$one->validate, "There were errors" );
is_deeply(
    $one->errors,
    [ 'field_c: fail', 'Field F: \'x\' is not an integer' ],
    "Correct errors"
);
is_deeply(
    $one->values,
    {
        field_a => 0,
        field_b => 1,
        field_d => 'x',
        field_e => 'x',
    },
    "Only valid values"
);
#}}}

#{{{ import
{
    package main::Test::Validator;
    use strict;
    use warnings;
    use Test::More;
    use Test::Exception;

    use PDT::Server::Validator qw/add_validator/;

    can_ok( __PACKAGE__, 'add_validator' );

    ok( add_validator( a => sub { 1 }), "Added validator" );

    dies_ok { add_validator a => sub { 1 }} "Duplicate";
    like( $@, qr/Validation 'a' already exists/, "Correct error" );

    dies_ok { add_validator b => 'b' } "Adding bad sub";
    like( $@, qr/add_validator takes a name and a coderef/, "correct error" );
}

{
    package main::Test::Validatee;
    use strict;
    use warnings;
    use Test::More;
    use Test::Exception;

    use PDT::Server::Validator qw/validate/;

    can_ok( __PACKAGE__, 'validate' );

    sub fields {[{
        -fields => [ 'a' ],
        a => [ 'text', 'integer' ]
    }]}

    my $tmp = validate({ a => 1 });
    isa_ok( $tmp, 'PDT::Server::Validator' );
    ok( !$tmp->errors, "No errors" );

    $tmp = validate({ a => 'x' });
    isa_ok( $tmp, 'PDT::Server::Validator' );
    ok( $tmp->errors, "Errors" );
    is_deeply(
        $tmp->errors,
        [ 'a: \'x\' is not an integer' ],
        "Correct errors"
    );
}

#}}}

done_testing;
