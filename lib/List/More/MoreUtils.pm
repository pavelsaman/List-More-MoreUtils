package List::More::MoreUtils;

use 5.030002;
use strict;
use warnings;
use Contextual::Return;
use Exporter 'import';

our @EXPORT_OK = qw(choice largest_range mirrored);
our %EXPORT_TAGS = (
    all  => \@EXPORT_OK,
    ALL  => \@EXPORT_OK,
    test => \@EXPORT_OK,
    TEST => \@EXPORT_OK,
);

our $VERSION = 0.001;

###############################################################################

sub choice {
    my $arg_ref = shift;

    my $list_ref = $arg_ref->{list_ref};
    my $n = $arg_ref->{n} // 1;

    if (not defined $list_ref
        or scalar @{ $list_ref } == 0) {
        return;
    }

    my $len = scalar @{ $list_ref };
    my @result = ();

    for my $i (1..$n) {
        push @result, $list_ref->[int rand $len]
    }

    if ($n == 1) {
        return $result[0];
    }

    return @result;
}

sub largest_range {
    my @list = @_;
    my ($min, $max);

    if (scalar @list == 0) {
        return;
    }

    my @sorted = sort {$a <=> $b} @list;
    $min = $max = $sorted[0];
    my @result = ($min, $max);

    foreach my $el (@sorted) {
        if ($el - $max > 1) {
            $min = $el;
        }
        $max = $el;
        if (($max - $min) > ($result[1] - $result[0])) {
            $result[0] = $min;
            $result[1] = $max;
        }
    }

    return
        SCALAR   { $result[1] - $result[0]                  }
        LIST     { @result                                  }
        ARRAYREF { \@result                                 }
        HASHREF  { { min => $result[0], max => $result[1] } }
        DEFAULT  { @result                                  }
    ;
}

sub _TRUE_  { return 1 };
sub _FALSE_ { return 0 };

sub mirrored {
    my @list = @_;

    if (scalar @list == 0) {
        return;
    }

    my $len = scalar @list;
    my $last_el_index = $len - 1;

    for my $i (0..int $len / 2) {
        if ($list[$i] != $list[$last_el_index - $i]) {
            return _FALSE_;
        }
    }

    return _TRUE_;
}

1;

__END__
