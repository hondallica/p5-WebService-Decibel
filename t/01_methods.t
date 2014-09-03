use strict;
use Test::More 0.98;
use WebService::Decibel;


my $decibel = new WebService::Decibel;

subtest album => sub {
    my $data = $decibel->album(id => '9e7eb16c-358f-e311-be87-ac220b82800d');
    is $data->{Search}{Id}, '9e7eb16c-358f-e311-be87-ac220b82800d';
    is $data->{Search}{IdType}, 'Decibel';
    is $data->{Search}{RetrievalDepth}, 'None';
    is $data->{Result}{Id}, '9e7eb16c-358f-e311-be87-ac220b82800d';
    is $data->{Result}{ArtistsLiteral}, 'Metallica';
    is $data->{Result}{Title}, 'Kill \'Em All';
    is $data->{Result}{IsUnofficial}, 0;
    is $data->{Result}{OriginalReleaseDate}, '1983-07-25';
    is $data->{Result}{Format}, 'Album';
    is $data->{Result}{ImageID}, '18cda626-aba7-4007-861a-22791ae25de7'
};

subtest albums => sub {
    my $data = $decibel->albums('artistName' => 'Metallica');

    is $data->{ResultCount}, 16;
    is $data->{PageCount}, 1;
    is $data->{TotalResultCount}, 16;

    is $data->{Search}{PageSize}, 50;
    is $data->{Search}{RetrievalDepth}, 'None';
    is $data->{Search}{PageNumber}, 1;
    is $data->{Search}{Artists}[0], 'Metallica';
    is $data->{Search}{ArtistSearchType}, 'FullName';

    is $data->{ResultSet}[0]{ImageID}, '18cda626-aba7-4007-861a-22791ae25de7';
    is $data->{ResultSet}[0]{Title}, 'Kill \'Em All';
    is $data->{ResultSet}[0]{IsUnofficial}, 0;
    is $data->{ResultSet}[0]{ArtistsLiteral}, 'Metallica';
    is $data->{ResultSet}[0]{Format}, 'Album';
    is $data->{ResultSet}[0]{Id}, '9e7eb16c-358f-e311-be87-ac220b82800d';
    is $data->{ResultSet}[0]{OriginalReleaseDate}, '1983-07-25';
};

subtest artists => sub {
    my $data = $decibel->artist('id' => '09ff7ede-318f-e311-be87-ac220b82800d');
    is $data->{Search}{IdType}, 'Decibel';
    is $data->{Search}{RetrievalDepth}, 'None';
    is $data->{Search}{Id}, '09ff7ede-318f-e311-be87-ac220b82800d';

    is $data->{Result}{Name}, 'Metallica';
    is $data->{Result}{ArtistType}, 'Act';
    is $data->{Result}{Id}, '09ff7ede-318f-e311-be87-ac220b82800d';
};

subtest artists => sub {
    my $data = $decibel->artists('name' => 'Metallica');
    is $data->{ResultCount}, 2;
    is $data->{TotalResultCount}, 2;
    is $data->{PageCount}, 1;

    is $data->{Search}{NameSearchType}, 'FullName';
    is $data->{Search}{PageSize}, 50;
    is $data->{Search}{Name}, 'Metallica';
    is $data->{Search}{PageNumber}, 1;
    is $data->{Search}{RetrievalDepth}, 'None';

    is $data->{ResultSet}[1]{Id}, '09ff7ede-318f-e311-be87-ac220b82800d';
    is $data->{ResultSet}[1]{Name}, 'Metallica';
    is $data->{ResultSet}[1]{ArtistType}, 'Act';
};

subtest disctags => sub {
    my $data = $decibel->disctags('id' => '9e7eb16c-358f-e311-be87-ac220b82800d');
    ok $data;
};

# The resource cannot be found.
#subtest image => sub {
#    my $data = $decibel->image('id' => '18cda626-aba7-4007-861a-22791ae25de7');
#    ok $data;
#    warn Dumper $data;
#};

subtest recordings => sub {
    my $data = $decibel->recordings(
        'artist' => 'Metallica',
        'title' => 'Battery',
    );
    is $data->{ResultSet}[0]{Title}, 'Battery';
};

subtest recording => sub {
    my $data = $decibel->recording(id => '01f034fc-b76c-11e3-be98-ac220b82800d');
    is $data->{Result}{OriginalAlbumTitle}, 'Master Of Puppets';
};

done_testing;

