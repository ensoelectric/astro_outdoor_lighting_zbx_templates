#!/usr/bin/perl
# Вычисление высоты Солнца над горизонтом в градусах в текущий момент
# get_sun_elevation.pl 55.7558 37.6173 127
# 55.7558 - широта в градусах
# 37.6173 - долгота в градусах
# 127 - высота над уровнем моря в метрах

use Astro::Coord::ECI;
use Astro::Coord::ECI::Sun;
use Astro::Coord::ECI::TLE;
use Astro::Coord::ECI::Utils qw{:all};

my ($lat, $lon, $elev) = (deg2rad($ARGV[0]), deg2rad($ARGV[1]), $ARGV[2]/1000);

my $time = time ();

my $loc = Astro::Coord::ECI->geodetic ($lat, $lon, $elev);

my $sun = Astro::Coord::ECI::Sun->universal ($time);

my ($azimuth, $elevation, $range) = $loc->azel ($sun);

print rad2deg ($elevation), "\n";