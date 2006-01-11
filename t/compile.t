# $Id: compile.t,v 1.2 2006/01/11 06:51:20 comdog Exp $

BEGIN {
	our @modules = qw(
		HTML::SimpleLinkExtor
		);
	}
	
use Test::More tests => scalar @modules;

foreach my $module ( @modules )
	{	
	print "bail out! [$module] has problems\n" unless use_ok( $module );
	}
