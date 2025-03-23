package Dist::Zilla::Plugin::UploadToDarkPAN;

use v5.26;
use strictures 2;

use Moose;
use namespace::autoclean;

extends 'Dist::Zilla::Plugin::UploadToCPAN';

# ABSTRACT: Release to a private CPAN (a.k.a a DarkPAN)

=head1 SYNOPSIS

In your dist.ini

  [UploadToDarkPAN]
  username    = example
  password    = changeme
  darkpan_uri = https://cpan-mirror.local/upload

=head1 DESCRIPTION

This plugin allows the C<release> command to upload your distribution to
a private CPAN (a.k.a a DarkPAN).

It extends L<Dist::Zilla::Plugin::UploadToCPAN> to replace the C<upload_uri>
value with a configurable C<darkpan_uri> value.

This plugin looks for configuration in C<dist.ini>, C<~/.dzil/config.ini>,
C<~/.pause>.

If the C<darkpan_uri> config value is not provided, you will be prompted
to provide it during the C<BeforeRelease> phase.

=cut

has upload_uri => (
    is      => 'ro',
    isa     => 'Str',
    lazy    => 1,
    default => sub {
        my $self = shift;
        return $self->_credential('darkpan_uri')
            || $self->pause_cfg->{darkpan_uri}
            || $self->zilla->chrome->prompt_str("DarkPAN URI: ");
    },
);

sub has_upload_uri {
    my $self = shift;
    return $self->upload_uri ? 1 : 0;
}

=head1 SEE ALSO

=over

=item L<Mojo::Darkpan>

=item L<OrePAN2::Server>

=item L<CPAN::Mirror::Tiny::Server>

=back

=cut

__PACKAGE__->meta->make_immutable;

1;
