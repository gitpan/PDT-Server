use strict;
use warnings;
use Test::More;

BEGIN { use_ok 'Catalyst::Test', 'PDT::Server' }
BEGIN { use_ok 'PDT::Server::Controller::Request' }

ok( request('/request')->is_success, 'Request should succeed' );
done_testing();
