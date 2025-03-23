# https://metacpan.org/pod/distribution/Module-CPANfile/lib/cpanfile.pod

requires 'Dist::Zilla::Plugin::UploadToCPAN';
requires 'perl', 'v5.26';
requires 'Moose';
requires 'namespace::autoclean';
requires 'strictures', '2';

on build => sub {
    requires 'Dist::Zilla';
    requires 'Dist::Zilla::Plugin::PodWeaver';
    requires 'Dist::Zilla::Plugin::Prereqs::FromCPANfile';
    requires 'Dist::Zilla::PluginBundle::Starter';
};
