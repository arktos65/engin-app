include "jira-ruby"

module IssuesLoader
  include ProjectConnector

  def get_project_issues
    client = JIRA::Client.new(get_options)
  end
end
