class JiraProject < ApplicationRecord
  belongs_to :project
  has_many :jira_issues

  validates_presence_of :name, :jira_key, :self_url
  validates_presence_of :project
end
