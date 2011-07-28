#!/usr/bin/perl
use Modern::Perl;

while (<>) {
    my $ip = '((?:\d{1,3}\.){3}\d{1,3})';
    my $user = '(\S+ )?';
    my $date2 = '\[(?:(\d+\/\w{3}\/\d{4}):(\d+:\d+:\d+) (?:.\d{4}))\]';
    my $req2 = '"([A-Z]+\s(.*) HTTP\/1.\d)"';
    my $refer = '"([a-z]+:\/\/\w+(?:\.\w+)+\/[^"]*)"';
    my $ua = '("[^"]+")';
    my $status = '(\d{3})';
    my $size = '(\d+ )?';

    my $log = '$ip - (\S+ )?- $date $req (\d{3}) - $refer $ua';
    $log = '$ip - (\S+ )?- $date $req (\d{3})';

    if (/^$ip - $user- $date2 $req2 $status (.*)$/) {
        # we don't care about success..
        next if $7 == 200;

        print "$1 \t $4 \t $7 \t $6";
        if ($8) { print " \t via: $8"; }
        say '';
    }
}
