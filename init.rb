require 'disable_mail_create_issue_patch'

Redmine::Plugin.register :redmine_disable_maile_create_issue do
  name 'Redmine Disable Mail Create Issue plugin'
  author 'Andrew Hills'
  description 'A Redmine plugin to disable the creation of new issues via mail.'
  version '0.1'
  url 'https://git.ednos.net/~ahills/redmine-disable-mail-create-issue.git'
  author_url 'https://ednos.net/'
end
