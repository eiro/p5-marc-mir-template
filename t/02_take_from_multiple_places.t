use Modern::Perl;
use MARC::MIR::Template;
use Test::More;
use YAML ();


for
(   [ "multiple subfields"
    , {100 => {qw( a title b title c title )}}
    , [ [ 100,
            [ [qw( a tata )]
            , [qw( b toto )]
            , [qw( c tutu )]]]]
    , {title => [qw( tata toto tutu )]} ]

# ,   [ "in multiple fields"
#     ,   { 100 => {qw( a title b title )}
#         , 200 => {qw( c title )} }
#     , [ [ 100,
#             [ [qw( a tata )]
#             , [qw( b toto )]]
#         , [ 200,
#             [ [qw( c tutu)]]]]]
#     , {title => [qw( tata toto tutu )]} ]

) { my ( $desc, $spec, $record, $expected ) = @$_;
    my $template = MARC::MIR::Template->new( $spec );
    my $got = $template->mir( $record );
    is_deeply $got, $expected, "gather informations from multiple places"; 
} 

done_testing;

