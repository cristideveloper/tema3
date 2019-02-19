use strict;
use warnings;
use diagnostics;
use Data::Dumper qw(Dumper);
use lib 'lib';
use Source;
use Destination;


my @array = new Source("test_perl_3.csv",";");
my $index = scalar @array;


#my @header = Source->get_header();
#my $row1 = Source->next_row();
#my $row2 = Source->next_row();

new Destination("new_test_perl_3.csv",";");

Destination->add_header(Source->get_header());
$index--;


while ($index){
	Destination->add_row(Source->next_row());
	$index--;
}	

Destination->print_columns_to_csv_in_order();

#print Dumper @array;
#print Dumper $header;
#print Dumper $head;
#print Dumper $header;

#print Dumper $row1;

#print Dumper $row2;
