class JiraProject < ApplicationRecord
  belongs_to :project

  validates_presence_of :name, :jira_key, :self_url
  validates_presence_of :project
end
