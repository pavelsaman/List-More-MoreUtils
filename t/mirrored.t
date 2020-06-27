#!/usr/bin/perl
use strict;
use warnings;
use Test::More tests => 9;

use List::More::MoreUtils qw(:test);

###############################################################################

subtest 'Mirrored 1' => sub {
    my @test_list = (1);
    
    is(mirrored(@test_list), 1);
};

subtest 'Mirrored 2' => sub {
    my @test_list = (1, 2, 2, 1);
    
    is(mirrored(@test_list), 1);
};

subtest 'Mirrored 3' => sub {
    my @test_list = (1, 2, 3, 2, 1);
    
    is(mirrored(@test_list), 1);
};

subtest 'Mirrored 4' => sub {
    my @test_list = (-1, 1, 2, 3, 3, 2, 1, -1);
    
    is(mirrored(@test_list), 1);
};

subtest 'Not Mirrored 1' => sub {
    my @test_list = (1, 2, 3, 3, 2, 1, -1);
    
    is(mirrored(@test_list), 0);
};

subtest 'Not Mirrored 2' => sub {
    my @test_list = (1, 2, 3);
    
    is(mirrored(@test_list), 0);
};

subtest 'Not Mirrored 3' => sub {
    my @test_list = (-1, 1, 2, 3, 3, 8, 1, -1);
    
    is(mirrored(@test_list), 0);
};

subtest 'Not Mirrored 4' => sub {
    my @test_list = (-1, 1, 2, 3, 8, 2, 1, -1);
    
    is(mirrored(@test_list), 0);
};

subtest 'Not Mirrored 5 - Undef' => sub {
    my @test_list = ();
    
    is(mirrored(@test_list), undef);
};
