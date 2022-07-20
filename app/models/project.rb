class Project < ApplicationRecord
  belongs_to :stream
  has_many :teams
  #  has_many :jira_projects

  validates_presence_of :stream, :name
end
