# $Id: test.pl,v 1.2 2001/11/09 08:17:04 comdog Exp $
# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl test.pl'

######################### We start with some black magic to print on failure.

# Change 1..1 below to 1..last_test_to_print .
# (It may become useful if the test is moved to ./t subdirectory.)

BEGIN { $test = 1; $| = 1; print "1..12\n"; }
END {print "not ok 1\n" unless $loaded;}
use HTML::SimpleLinkExtor;
$loaded = 1;
print "ok $test\n";

######################### End of black magic.

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
$test++;
my $p = new HTML::SimpleLinkExtor();
print ref $p ? "" : "not ", "ok $test\n";

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
$test++;
$p->parse_file('example.html');
my @links = $p->links;

print @links == 22 ? "" : "not ", "ok $test\n";

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
my @test = qw(
	href	     14
	background    1
	src           7
	
	base          1
	body          1
	a             7
	img           4
	area          6
	frame         3
	);
	
while ( my $method = shift @test )
	{
	$test++;
	
	my $expected = shift @test;

	my @list = $p->$method();
	
	print @list == $expected ? "" : "not ", "ok $test\n";
	}
