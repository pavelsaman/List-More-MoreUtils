use strict;
use warnings;
use Test::More tests => 7;

use List::More::MoreUtils qw(:test);

###############################################################################

subtest 'Get Random List Element' => sub {
    my @test_list = (1, 2, 3, 4);

    my $result = choice({ list_ref => \@test_list });
    my @is_in_test_list = grep { $_ == $result} @test_list;
    is(scalar @is_in_test_list, 1);
};

subtest 'Zero-length List' => sub {
    my @test_list = ();

    is(choice({ list_ref => \@test_list }), undef);
};

subtest 'Undef Values In List' => sub {
    my @test_list = (undef, undef);

    is(choice({ list_ref => \@test_list }), undef);
};

subtest 'Get Random List Elements' => sub {
    my @test_list = (1, 2, 3, 4);

    my @result = choice({ list_ref => \@test_list, n => 2 });
    is(scalar @result, 2);
};

subtest 'Get Random List Elements - n Greater Than List Len' => sub {
    my @test_list = (1, 2, 3, 4);

    my @result = choice({ list_ref => \@test_list, n => 6 });
    is(scalar @result, 6);
};

subtest 'Get Random List Elements - n == 0' => sub {
    my @test_list = (1, 2, 3, 4);

    my @result = choice({ list_ref => \@test_list, n => 0 });
    is(scalar @result, 0);
};

subtest 'Get Random List Elements - Negative n' => sub {
    my @test_list = (1, 2, 3, 4);

    my @result = choice({ list_ref => \@test_list, n => -1 });
    is(scalar @result, 0);
};
