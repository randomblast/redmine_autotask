require 'redmine'

require 'dispatcher'

Dispatcher.to_prepare :redmine_autotask do
  require_dependency 'issue_finder'
  unless Changeset.included_modules.include? RedmineAutotask::ChangesetPatch
    Changeset.send(:include, RedmineAutotask::ChangesetPatch)
  end
end

Redmine::Plugin.register :redmine_autotask do
  name 'Redmine Autotask plugin'
  author 'Josh Channings'
  description 'Automatically generate Issues based on TODO/FIXME comments in Changesets'
  version '0.0.1'
  url 'http://github.com/randomblast/autotask'
  author_url 'http://www.channings.me.uk'
end
