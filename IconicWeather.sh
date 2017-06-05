#!/bin/bash

METRIC=1 #Should be 0 or 1; 0 for F, 1 for C
 
if [ -z $1 ]; then
echo
echo "USAGE: weather.sh <locationcode>"
echo
exit 0;
fi

curl -s http://rss.accuweather.com/rss/liveweather_rss.asp\?metric\=${METRIC}\&locCode\=$1 | perl -ne 'use utf8;
if (/Currently/) {
    chomp;
    /\<title\>Currently: (.*)?\<\/title\>/;
    my @values = split(":", $1);
    #print "$values[0] $values[1]";

    if ($values[0] eq "Sunny" || $values[0] eq "Hazy Sunshine" || $values[0] eq "Hazy Sunshine" || $values[0] eq "Hot") {
        my $sun = "\x{f00d}";
        binmode(STDOUT, ":utf8");
        print "$sun";
    }

    if ($values[0] eq "Mostly Sunny" || $values[0] eq "Partly Sunny" || $values[0] eq "Intermittent Clouds") {
        my $mostlysun = "\x{f00c}";
        binmode(STDOUT, ":utf8");
        print "$mostlysun";
    }

    if ($values[0] eq "Mostly Cloudy" ) {
        my $mcloud = "\x{f002}";
        binmode(STDOUT, ":utf8");
        print "$mcloud";
    }

    if ($values[0] eq "Cloudy" || $values[0] eq "Dreary (Overcast)" || $values[0] eq "Fog") {
        my $cloud = "\x{f041}";
        binmode(STDOUT, ":utf8");
        print "$cloud";
    }

    if ($values[0] eq "Mostly Cloudy W/ Showers" || $values[0] eq "Partly Sunny W/ Showers") {
        my $cloudshowers = "\x{f004}";
        binmode(STDOUT, ":utf8");
        print "$cloudshowers";
    }

    if ($values[0] eq "Mostly Cloudy W/ T-Storms" || $values[0] eq "Partly Sunny W/ T-Storms" || $values[0] eq "T-Storms" ) {
        my $thunder = "\x{f005}";
        binmode(STDOUT, ":utf8");
        print "$thunder";
    }

    if ($values[0] eq "Showers" || $values[0] eq "Rain")
    {
        my $rain = "\x{f019}";
        binmode(STDOUT, ":utf8");
        print "$rain";
    }
    if ($values[0] eq "Windy")
    {
        my $wind = "\x{f050}";
        binmode(STDOUT, ":utf8");
        print "$wind";
    }
    if ($values[0] eq "Flurries" || $values[0] eq "Mostly Cloudy W/ Flurries" || $values[0] eq "Partly Sunny W/ Flurries" || $values[0] eq "Snow" || $values[0] eq "Mostly Cloudy W/ Snow" || $values[0] eq "Ice" || $values[0] eq "Sleet" || $values[0] eq "Freezing Rain" || $values[0] eq "Rain and Snow" || $values[0] eq "Cold")
    {
        my $snow = "\x{f064}";
        binmode(STDOUT, ":utf8");
        print "$snow";
    }
    if ($values[0] eq "Clear" || $values[0] eq "Mostly Clear" || $values[0] eq "Hazy Moonlight") {
        my $night = "\x{f02e}";
        binmode(STDOUT, ":utf8");
        print "$night";
    }
    print"$values[1]";
}'

# This was used over the last print statement to add a night icon, does not work, since it shows during day...
#    if ($values[0] eq "Clear" || $values[0] eq "Mostly Clear" || $values[0] eq "Partly Cloudy" || $values[0] eq "Intermittent Clouds" || $values[0] eq "Hazy Moonlight" || $values[0] eq "Mostly Cloudy" || $values[0] eq "Partly Cloudy w/ Showers" || $values[0] eq "Mostly Cloudy w/ Showers" || $values[0] eq "Partly Cloudy w/ T-Storms" || $values[0] eq "Mostly Cloudy w/ Flurries" || $values[0] eq "Mostly Cloudy w/ Snow")
#    {
#        my $night = "\x{f02e}";
#        binmode(STDOUT, ":utf8");
#        print "$night";
#    }
