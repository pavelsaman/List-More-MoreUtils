use 5.030002;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME              => 'List::More::MoreUtils',
    VERSION_FROM      => 'lib/List/More/MoreUtils.pm',
    PREREQ_PM         => {
        'Contextual::Return' => 0
    },
    ABSTRACT_FROM     => 'lib/List/More/MoreUtils.pm',
    AUTHOR            => 'Pavel Saman <pavelsam@centrum.cz>',
    LICENSE           => 'perl'
);
