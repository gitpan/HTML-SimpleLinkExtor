use File::Spec;
use Test::More 'no_plan';

use_ok( "HTML::SimpleLinkExtor" );
ok( defined &HTML::SimpleLinkExtor::absolute_links, 
	"relative_links() is defined" );

my $file = 't/example2.html';
ok( -e $file, "Example file is there" );

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

{
my $p = HTML::SimpleLinkExtor->new;
ok( ref $p, "Made parser object" );
isa_ok( $p, 'HTML::SimpleLinkExtor' );
can_ok( $p, 'schemes' );

$p->parse_file( $file );

my @links = $p->absolute_links;
my $links = $p->absolute_links;

is( scalar @links, $links, "Array and scalar context get same answer" );
is( $links, 11, "Found the right number of links" );
}
