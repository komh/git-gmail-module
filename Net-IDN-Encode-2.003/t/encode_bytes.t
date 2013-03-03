use bytes;
use strict;

BEGIN { binmode STDOUT, ':utf8'; binmode STDERR, ':utf8'; }

use Test::More tests => 24;
use Test::NoWarnings;

use Net::IDN::Encode qw(:all);

is(to_ascii('mueller'),'mueller');
is(to_ascii('xn--mller-kva'),'xn--mller-kva');
is(to_ascii('m�ller'),'xn--mller-kva');

is(to_unicode('mueller'),'mueller');
is(to_unicode('xn--mller-kva'),'m�ller');
is(to_unicode('m�ller'),'m�ller');

is(domain_to_ascii('mueller.example.com'),'mueller.example.com');
is(domain_to_ascii('xn--mller-kva.example.com'),'xn--mller-kva.example.com');
is(domain_to_ascii('m�ller.example.com'),'xn--mller-kva.example.com');

is(domain_to_unicode('mueller.example.com'),'mueller.example.com');
is(domain_to_unicode('xn--mller-kva.example.com'),'m�ller.example.com');
is(domain_to_unicode('m�ller.example.com'),'m�ller.example.com');

is(email_to_ascii('hans@mueller.example.com'),'hans@mueller.example.com');
is(email_to_ascii('hans@xn--mller-kva.example.com'),'hans@xn--mller-kva.example.com');
is(email_to_ascii('hans@m�ller.example.com'),'hans@xn--mller-kva.example.com');
is(email_to_ascii(''), '');
is(email_to_ascii(undef), undef);
is(email_to_ascii('test'), 'test');

is(email_to_unicode('hans@mueller.example.com'),'hans@mueller.example.com');
is(email_to_unicode('hans@xn--mller-kva.example.com'),'hans@m�ller.example.com');
is(email_to_unicode(''),'');
is(email_to_unicode(undef), undef);
is(email_to_unicode('test'),'test');
