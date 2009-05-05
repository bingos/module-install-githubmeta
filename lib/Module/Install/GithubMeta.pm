package Module::Install::GithubMeta;

use strict;
use warnings;
use base qw(Module::Install::Base);
use vars qw($VERSION);

$VERSION = '0.02';

sub githubmeta {
  my $self = shift;
  return unless $Module::Install::AUTHOR;
  require Capture::Tiny;
  return unless -e '.git';
  return unless $self->can_run('git');
  warn "Meep\n";
  return 1;
}

'Github';
__END__

=head1 NAME

Module::Install::GithubMeta - A Module::Install extension to include GitHub meta information in META.yml

=cut
