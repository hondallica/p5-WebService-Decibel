use strict;
use Test::More 0.98;
use WebService::Decibel;
use Data::Dumper;


my $decibel = new WebService::Decibel;
isa_ok $decibel, 'WebService::Decibel';

my $artists = $decibel->artists({
    name => 'Metallica',
});
ok $artists;
warn Dumper $artists;

my $artist = $decibel->artist_by_id(
    $artists->{Results}[0]{Id},
    { depth => 'Biography' }
);
ok $artist;
warn Dumper $artist;


done_testing;

