use strict;
use warnings;
use diagnostics;
use Data::Dumper qw(Dumper);
use lib 'lib';
use Source;
use Destination;


my @array = new Source("test_perl_3.csv",";");
my $index = scalar @array;

new Destination("new_test_perl_3.csv",";");

Destination->add_header(Source->get_header());
$index--;

while ($index){
	Destination->add_row(Source->next_row());
	$index--;
}	

Destination->print_columns_to_csv_in_order();


