class AddJiraToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :jira_project_id, :integer
    add_column :projects, :jira_project_name, :string
  end
end
