require 'disable_mail_create_issue_patch'

Redmine::Plugin.register :redmine_disable_mail_create_issue do
  name 'Redmine Disable Mail Create Issue plugin'
  author 'Andrew Hills'
  description 'A Redmine plugin to disable the creation of new issues via mail.'
  version '0.1'
  url 'https://git.ednos.net/~ahills/redmine_disable_mail_create_issue.git'
  author_url 'https://ednos.net/'

  settings :default => {
      :reject_message => <<EOF
The subject of your message indicates that it details a new issue or an
improperly-formatted reply. To reply to an issue or message, please leave
the subject line intact. To open a new issue, please visit:

http://hostname/
EOF
  }, :partial => 'settings/disable_mail_create_issue_settings'
end
