# $Id: compile.t,v 1.1 2004/06/15 19:43:42 comdog Exp $

BEGIN {
	our @modules = qw(
		HTML::SimpleLinkExtor
		);
	}
	
use Test::More tests => scalar @modules;

foreach my $module ( @modules )
	{	
	print "bail out! [$module] has problems\n" 
		unless use_ok( $module );
	}
