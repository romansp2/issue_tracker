require_dependency 'issue_tracker_hook_listener'

Redmine::Plugin.register :issue_tracker do

  name 'Issue Tracker plugin'
  author 'Paul Roman'
  description 'Send HTTP POST request with information about updated issue'
  version '0.0.1'

end
