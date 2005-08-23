# $Id: parse.t,v 1.4 2005/08/23 03:44:01 comdog Exp $

###############################################################
###############################################################
BEGIN {
our %tags = qw(	
	base          1
	body          1
	a             7
	img           4
	area          6
	frame         3
	script        1
	iframe        1
	);

our %attr = qw(
	href	     14
	background    1
	src           9
	);
	
our $total_links = 0;
foreach my $attr ( keys %attr ) { $total_links += $attr{$attr} };
}
###############################################################
###############################################################

use Test::More tests => keys( %attr ) + keys( %tags ) + 6;

use_ok( "HTML::SimpleLinkExtor" );

my $file = 't/example.html';
ok( -e $file, "Example file is there" );

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
$test++;
my $p = new HTML::SimpleLinkExtor();
ok( ref $p, "Made parser object" );

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
$test++;
$p->parse_file( $file );
my @links = $p->links;

is( scalar @links, $total_links, "Found the right number of links" );

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
foreach my $hash ( \%attr, \%tags )
	{
	foreach my $method ( keys %$hash )
		{
		my @list = $p->$method();
		
		is( scalar @list, $hash->{$method}, 
			"Found the right number of links for <$method>" );
		}
	}

my $frame      = scalar @{ [$p->frame] };
my $iframe     = scalar @{ [$p->iframe] };
my $all_frames = scalar @{ [$p->frames] };
is( $all_frames, $frame + $iframe, "Combined frames count is right" );

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
use Data::Dumper;
#print STDERR Dumper( $p );

$p->clear_links;
#print STDERR Dumper( $p );
@links = $p->links;

is( scalar @links, 0, "Found the no links after clear_links" );


