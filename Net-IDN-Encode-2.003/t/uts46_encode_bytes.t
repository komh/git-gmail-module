use bytes;
use strict;

BEGIN { binmode STDOUT, ':utf8'; binmode STDERR, ':utf8'; }

use Test::More tests => 1 + 6;
use Test::NoWarnings;

use Net::IDN::UTS46 qw(:all);

is(uts46_to_ascii('mueller'),'mueller');
is(uts46_to_ascii('xn--mller-kva'),'xn--mller-kva');
is(uts46_to_ascii('m�ller'),'xn--mller-kva');

is(uts46_to_unicode('mueller'),'mueller');
is(uts46_to_unicode('xn--mller-kva'),'m�ller');
is(uts46_to_unicode('m�ller'),'m�ller');

