use strict;
use warnings;
use Test::More tests => 1;
use Test::Perl::Critic (-severity => 2);

use List::More::MoreUtils qw(:test);

###############################################################################

subtest 'Perl Critic' => sub {
    critic_ok("lib/List/More/MoreUtils.pm");
};
