# NAME

Dist::Zilla::Plugin::UploadToDarkPAN - Release to a private CPAN (a.k.a a DarkPAN)

# VERSION

version 1.0.0

# SYNOPSIS

In your dist.ini

    [UploadToDarkPAN]
    username    = example
    password    = changeme
    darkpan_uri = https://cpan-mirror.local/upload

# DESCRIPTION

This plugin allows the `release` command to upload your distribution to
a private CPAN (a.k.a a DarkPAN).

It extends [Dist::Zilla::Plugin::UploadToCPAN](https://metacpan.org/pod/Dist%3A%3AZilla%3A%3APlugin%3A%3AUploadToCPAN) to replace the `upload_uri`
value with a configurable `darkpan_uri` value.

This plugin looks for configuration in `dist.ini`, `~/.dzil/config.ini`,
`~/.pause`.

If the `darkpan_uri` config value is not provided, you will be prompted
to provide it during the `BeforeRelease` phase.

# SEE ALSO

- [Mojo::Darkpan](https://metacpan.org/pod/Mojo%3A%3ADarkpan)
- [OrePAN2::Server](https://metacpan.org/pod/OrePAN2%3A%3AServer)
- [CPAN::Mirror::Tiny::Server](https://metacpan.org/pod/CPAN%3A%3AMirror%3A%3ATiny%3A%3AServer)

# AUTHOR

Oliver Youle <oliver@youle.io>

# COPYRIGHT AND LICENSE

This software is Copyright (c) 2025 by Oliver Youle.

This is free software, licensed under:

    The GNU General Public License, Version 3, June 2007
