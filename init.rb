require 'redmine'

require 'dispatcher'

Dispatcher.to_prepare :redmine_autotask do
  require_dependency 'issue_finder'
  unless Change.included_modules.include? RedmineAutotask::ChangePatch
    Change.send(:include, RedmineAutotask::ChangePatch)
  end
end

Redmine::Plugin.register :redmine_autotask do
  name 'Redmine Autotask plugin'
  author 'Josh Channings'
  description 'Automatically generate Issues based on TODO/FIXME comments in Changes'
  version '0.0.1'
  url 'http://github.com/randomblast/autotask'
  author_url 'http://www.channings.me.uk'
end
