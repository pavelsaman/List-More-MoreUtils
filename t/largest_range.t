use strict;
use warnings;
use Test::More tests => 13;

use List::More::MoreUtils qw(:test);

###############################################################################

subtest 'Test Data 1' => sub {
    my @test_list = (1, 2, 3, 4);

    my @result = largest_range(@test_list);
    is($result[0], 1);
    is($result[1], 4);
};

subtest 'Test Data 2' => sub {
    my @test_list = (-1, 0, 1, 2, 3, 4);

    my @result = largest_range(@test_list);
    is($result[0], -1);
    is($result[1], 4);
};

subtest 'Test Data 3' => sub {
    my @test_list = (-1, 1, 2, 3, 4);

    my @result = largest_range(@test_list);
    is($result[0], 1);
    is($result[1], 4);
};

subtest 'Test Data 4' => sub {
    my @test_list = (-1, 1, 2, 3, 4, 10, 11, 12, 13, 14, 20);

    my @result = largest_range(@test_list);
    is($result[0], 10);
    is($result[1], 14);
};

subtest 'Test Data 5' => sub {
    my @test_list = (-1, 1, 2, 3, 4, 10, 11, 12, 13, 20);

    my @result = largest_range(@test_list);
    is($result[0], 1);
    is($result[1], 4);
};

subtest 'Test Data 6' => sub {
    my @test_list = (80, 1, 5, 3, 8, 2);

    my @result = largest_range(@test_list);
    is($result[0], 1);
    is($result[1], 3);
};

subtest 'Test Data 7' => sub {
    my @test_list = (80);

    my @result = largest_range(@test_list);
    is($result[0], 80);
    is($result[1], 80);
};

subtest 'Test Data 8' => sub {
    my @test_list = ();

    is(largest_range(@test_list), undef);
};

subtest 'Test Data 9' => sub {
    my @test_list = (87, 2, 4, 80, 90, 88, 87, 82, 81, 80, 84, 83, 85, 86, 89);

    my @result = largest_range(@test_list);
    is($result[0], 80);
    is($result[1], 90);
};

subtest 'Test Data 1 - Scalar Context' => sub {
    my @test_list = (1, 2, 3, 4);

    my $result = largest_range(@test_list);
    is($result, 3);
};

subtest 'Test Data 2 - Scalar Context' => sub {
    my @test_list = (-1, 0, 1, 2, 3, 4);

    my $result = largest_range(@test_list);
    is($result, 5);
};

subtest 'Test Data 3 - Scalar Context' => sub {
    my @test_list = (80);

    my $result = largest_range(@test_list);
    is($result, 0);
};

subtest 'Test Data 4 - Scalar Context' => sub {
    my @test_list = (87, 2, 4, 80, 90, 88, 87, 82, 81, 80, 84, 83, 85, 86, 89);

    my $result = largest_range(@test_list);
    is($result, 10);
};
