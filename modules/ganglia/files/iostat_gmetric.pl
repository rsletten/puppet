#!/usr/bin/perl
#
# iostat_gmetric:
#
# simple script to parse iostat output
# and push the data into ganglia
#
# iostat -x 20 | iostat_gmetric
# iostat -d 20 | iostat_gmetric
#
# tkimball Tue Apr 26 17:46:18 EDT 2011
 
use strict;
use warnings;
 
my $gmetric = '/usr/bin/gmetric';
my $gconf = '/etc/ganglia/gmond.conf';
 
if ( ! -x $gmetric )
{
    print "ERROR: Unable to execute $gmetric, exiting.\n";
    exit 1;
}
 
if ( ! -r $gconf )
{
    print "ERROR: Unable to read $gconf, exiting.\n";
    exit 1;
}
 
my @headers = ();
while(<STDIN>)
{
    if (scalar(@headers) == 0)
    {
        if ($_ =~ m/^Device/)
        {
            chomp;
      $_ =~ s/\://g;
            $_ =~ s/\%//g;
            $_ =~ s/\/s/_sec/g;
            foreach my $x (split('\ ', $_))
            {
                push(@headers, $x) if ($x ne '');
            }
        }
    }
    my @stats;
    if ($_ =~ m/[hms]d[a-z]/)
    {
        chomp;
        foreach my $x (split('\ ', $_))
        {
            push(@stats, $x) if ($x ne '');
        }
        my $count = scalar(@stats);
        for (my $y = 1; $y < $count; $y++)
        {
            my $rc = qx|$gmetric -c $gconf --name=iostat_$stats[0]_$headers[$y] --value=$stats[$y] --type=float --units=$headers[$y]|;

            if ($? != 0)
            {
                print "ERROR: $gmetric failed to execute, exiting.\n";
                exit 1;
            }
        }
    }
}
