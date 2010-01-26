#!/usr/bin/env perl
# IMPORTANT: if you delete this file your app will not work as
# expected.  You have been warned.
use inc::Module::Install;

name 'PDT-Server';
all_from 'lib/PDT/Server.pm';

requires 'Catalyst::Action::RenderView';
requires 'Catalyst::Plugin::ConfigLoader';
requires 'Catalyst::Plugin::Session';
requires 'Catalyst::Plugin::Session::State::Cookie';
requires 'Catalyst::Plugin::Session::Store::FastMmap';
requires 'Catalyst::Plugin::Static::Simple';
requires 'Catalyst::Runtime' => '5.80016';
requires 'Catalyst::View::Mason';
requires 'DBD::Pg';
requires 'Data::Dumper';
requires 'Digest::SHA';
requires 'Fey::DBIManager';
requires 'Fey::Loader';
requires 'Fey::ORM';
requires 'GD::SecurityImage';
requires 'Module::Pluggable';
requires 'Moose';
requires 'MooseX::ClassAttribute';
requires 'MooseX::Types';
requires 'PDT::Config';
requires 'YAML::Syck';
requires 'namespace::autoclean';

test_requires 'Test::More' => '0.94';
test_requires 'Test::Exception';

catalyst;

install_script glob('script/*.pl');
auto_install;

tests_recursive();

sub MY::postamble {
    return <<EOT;
test-testers:
\tprove -I lib t/00-testers/*.t

test-backend:
\tprove -I lib t/00-testers/*.t t/01-backend/*.t

test-frontend:
\tprove -I lib t/02-frontend/*.t

dbinit:
\tdropdb pdt || true
\tcreatedb pdt
\tpsql pdt < `ls database/psql/* | sort`
EOT
}

WriteAll;
