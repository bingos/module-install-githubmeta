package Module::Install::GithubMeta;

use strict;
use warnings;
use base qw(Module::Install::Base);
use vars qw($VERSION);

$VERSION = '0.02';

sub githubmeta {
  my $self = shift;
  return unless $Module::Install::AUTHOR;
  return unless -e '.git';
  return unless $self->can_run('git');
  return unless my ($git_url) = `git remote show origin` =~ /URL: (.*)$/m;
  return unless $git_url =~ /github\.com/; # Not a Github repository
  my $http_url = $git_url;
  $git_url =~ s![\w\-]+\@([^:]+):!git://$1/!;
  $http_url =~ s![\w\-]+\@([^:]+):!http://$1/!;
  $http_url =~ s!\.git$!/tree!;
  $self->repository( $git_url );
  $self->homepage( $http_url ) unless $self->homepage();
  return 1;
}

'Github';
__END__

=head1 NAME

Module::Install::GithubMeta - A Module::Install extension to include GitHub meta information in META.yml

=cut
