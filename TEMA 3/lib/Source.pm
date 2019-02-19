package Source;
use strict;
use warnings;
use Data::Dumper qw(Dumper);

my $fh;
my @new_array;
sub new{
	my $class =shift;
	my $self = {
		file => shift,
		separator => shift
		};
	bless $self, $class;
	open my $fh , '<' ,$self->{file} 
		or die "\nUnable to open file : $_";

	my @array = <$fh>;
	for my $i (0..$#array){
			my @row = split /$self->{separator}/, $array[$i];
			chomp (@row); 
			my $row = \@row; 
			push @new_array, $row;
	}


		return @new_array;

}

sub get_header{
	my $header = shift @new_array;
	#print Dumper @new_array;
	return $header;
}

sub next_row{
	my $row = shift @new_array;
	return $row;
}

sub close_file{
	close $fh or die "Couldn't Close File $fh : $_";

}

1;