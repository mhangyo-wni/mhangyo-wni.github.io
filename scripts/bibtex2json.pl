#!/usr/bin/env perl

use strict;
use utf8;
use BibTeX::Parser;
use JSON;
use open qw/:utf8 :std/;
use 5.010;

my ($input_dir,$output_dir) = @ARGV;

opendir(my $INPUT_DIR, $input_dir);

while(my $file = readdir($INPUT_DIR) )
{
	next if $file !~ /\.bib$/;
	open(my $fh,"$input_dir/$file");
	my $parser = BibTeX::Parser->new($fh);
	my $output = [];
	while (my $entry = $parser->next ) {
		if ($entry->parse_ok) {
			my $entry_ref;
			$entry_ref->{type} = $entry->type;
			for my $field_name ("title")
			{
				$entry_ref->{$field_name} = $entry->field($field_name);
			}

			
			$entry_ref->{date} = sprintf("%4d-%02d",$entry->field("year"),$entry->field("month"));

			if($entry_ref->{type} eq "ARTICLE")
			{
				$entry_ref->{publised} = sprintf("%s, Vol. %d No. %d",$entry->field("journal"),$entry->field("volume"),$entry->field("number"));

			}
			elsif($entry_ref->{type} eq "INPROCEEDINGS")
			{
				$entry_ref->{publised} = sprintf("%s",$entry->field("booktitle"));
			}
			elsif($entry_ref->{type} eq "PHDTHESIS")
			{
				$entry_ref->{publised} = sprintf("%s",$entry->field("school"));
			}
			

			my @authors = $entry->author;
			my @editors = $entry->editor;

			my @author_names;
			foreach my $author (@authors) {
				my $author_name;
				if($author->to_string =~ /\p{Han}/)
				{# 和名
					$author_name = $author->to_string;
				}
				else
				{
					$author_name = $author->first ." ".$author->last;
				}
				push(@author_names,$author_name);
			}
			$entry_ref->{authors} = \@author_names;

			
			push(@{$output},$entry_ref);
		} else {
			warn "Error parsing file: " . $entry->error;
		}

	}
	my $OUTPUT;
	if($output_dir)
	{
		my $output_json_name = $file =~ s{(\.bib)$}{.json}r;
		open($OUTPUT, ">","$output_dir/$output_json_name") or die $!;;
	}
	else
	{
		$OUTPUT = *STDOUT;
	}

	print $OUTPUT to_json($output,{pretty=>1});
	
	
}


