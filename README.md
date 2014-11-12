# NAME

WebService::Decibel - A simple and fast interface to the Decibel API

# SYNOPSIS

    use WebService::Decibel;

    my $decibel = new WebService::Decibel(
        app_id  => 'YOUR_APPLICATION_ID',
        app_key => 'YOUR_APPLICATION_KEY',
    );

    my $artists = $decibel->artists({ name => 'Metallica' });
    my $artist = $decibel->artist(
        '09ff7ede-318f-e311-be87-ac220b82800d',
        { depth => 'Biography' },
    );

# DESCRIPTION

The module provides a simple interface to the www.decibel.net API. To use this module, you must first sign up at [https://developer.decibel.net](https://developer.decibel.net) to receive an Application ID and Key.

# METHODS

These methods usage: [https://developer.decibel.net/our-api](https://developer.decibel.net/our-api)

### artists

    my $artists = $decibel->artists({ name => 'Metallica' });

### artist

    my $artist = $decibel->artist(
        '09ff7ede-318f-e311-be87-ac220b82800d',
        { depth => 'Biography' },
    );

# SEE ALSO

[https://developer.decibel.net](https://developer.decibel.net)

# LICENSE

Copyright (C) Hondallica.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# AUTHOR

Hondallica <hondallica@gmail.com>
