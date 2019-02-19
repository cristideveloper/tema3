package Destination;
use strict;
use warnings;
use Data::Dumper qw(Dumper);
my $fh2;
my @array;
sub new{
	my $class = shift;
	my $self = {
		file => shift,
		separator => shift
	};
	bless $self, $class;

	open my $fh2 , '>>' ,$self->{file} 
		or die "\nUnable to open file : $_";
	}

sub add_header{ 
	my @header = shift;
	unshift(@array, @header);
	}

sub add_row{
	my @row = shift;
	unshift(@array, @row);	
}
	

sub return_array{
	return @array;
	}

sub sort_rows_by_column{
	my $column=shift;
	my $type=shift;
	if ($type=="asc"){
		@array = sort { $a->[$column] cmp $b->[$column] } @array;
	} else {
		if ($type=="desc") {
		@array = sort { $b->[$column] cmp $a->[$column] } @array;
	}
	}	
}

sub print_columns_to_csv_in_order{
	print Dumper @array;
}

1;
