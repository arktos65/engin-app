include "jira-ruby"

module ProjectsLoader
  include ProjectConnector

  # Query Jira for all projects and load them into the database
  # table.
  def update_all_projects
    client = JIRA::Client.new(get_options)
    projects = client.Project.all

    # Iterate through projects and upsert each record to database
    projects.each do |project|
      upsert_project(project)
    end
  end

  private

  # This method upserts a single Jira project into the jira_projects database
  # table.
  def upsert_project(the_project)
    project = JiraProject.find_by(id: the_project.id)
    project.create!(
      jira_project_id: the_project.id,
      name: the_project.name,
      jira_key: the_project.key,
      total_issue_count: the_project.total_issue_count,
      last_issue_update: the_project.last_issue_update,
      self_url: the_project.self
    ) if project.nil?
    project.update!(
      name: the_project.name,
      jira_key: the_project.key,
      total_issue_count: the_project.total_issue_count,
      last_issue_update: the_project.last_issue_update,
      self_url: the_project.self
    ) unless project.nil?
    project.save
  end
end
