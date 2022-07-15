class CreateJiraIssues < ActiveRecord::Migration[6.1]
  def change
    create_table :jira_issues do |t|
      t.integer :jira_issue_id
      t.belongs_to :jira_project, null: false, foreign_key: true
      t.text :issue_key, null: false
      t.text :issue_url, null: false
      t.text :issue_title, null: false
      t.text :issue_status, null: false
      t.text :issue_type, null: false
      t.integer :story_points, default: 1
      t.datetime :issue_created
      t.datetime :issue_updated

      t.timestamps
    end
    add_index :jira_issues, :jira_issue_id
  end
end
