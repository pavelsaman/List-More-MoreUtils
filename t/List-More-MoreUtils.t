use strict;
use warnings;
use Test::More tests => 1;

use List::More::MoreUtils qw(:test);

###############################################################################

subtest 'Compile Module' => sub {
    use_ok('List::More::MoreUtils');
};

