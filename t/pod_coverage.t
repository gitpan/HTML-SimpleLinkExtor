# $Id: pod_coverage.t 1611 2005-03-12 04:52:25Z comdog $

use Test::More;
eval "use Test::Pod::Coverage";

if( $@ )
	{
	plan skip_all => "Test::Pod::Coverage required for testing POD";
	}
else
	{
	plan tests => 1;

	pod_coverage_ok( "HTML::SimpleLinkExtor" );      
	}
