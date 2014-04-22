use Modern::Perl;
use MARC::MIR::Template;
use Test::More;
use YAML ();

my ($spec,$expected,$record) = YAML::Load << 'END';
100: {a: title, b: title, c: title}
---
title: [ tata, toto, tutu ]
---
- [100, [ [a, tata], [b, toto], [b, tutu] ]]
END

my $template = MARC::MIR::Template->new( $spec );
my $got = $template->mir( $record );
is_deeply $got, $expected, "gather informations from multiple places";
done_testing;

