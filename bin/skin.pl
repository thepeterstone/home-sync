#!/usr/bin/perl

use Imager::SkinDetector;

# Use whatever format your Imager supports
my $name = shift; # || 'bike1.bmp';

# Check a local file
my $image = Imager::SkinDetector->new(file => $name) or die "Can't load image [$name]\n";

# Check an image on the web
#my $image = Imager::SkinDetector->new(url => $name) or die "Can't load image!\n";

my $skinniness = $image->skinniness();
printf "Image is %3.2f%% skinny\n", $skinniness * 100;

my $prob = $image->contains_nudity();
printf "Contains nudity with a %.2f%% probability\n", $prob * 100;
