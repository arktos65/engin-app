class CreateJiraProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :jira_projects do |t|
      t.belongs_to :project, null: false, foreign_key: false
      t.integer :jira_project_id, null: false
      t.string :name, null: false
      t.string :jira_key, null: false
      t.integer :total_issue_count, default: 0
      t.datetime :last_issue_update
      t.string :self_url

      t.timestamps
    end
    add_index :jira_projects, :jira_project_id
    add_index :jira_projects, :name
  end
end
