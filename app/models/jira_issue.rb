class JiraIssue < ApplicationRecord
  belongs_to :jira_project

  validates_presence_of :issue_key, :issue_url, :issue_title,
                        :issue_status, :issue_type
  validates_presence_of :jira_project
end
