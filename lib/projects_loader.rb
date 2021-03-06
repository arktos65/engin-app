require 'jira-ruby'

module ProjectsLoader
  include ProjectConnector

  # Query Jira for all projects and load them into the database
  # table.
  def update_all_projects
    puts "#{Time.now().strftime('%F - %H:%M:%S.%L')}:   Connecting to Jira instance"
    client = JIRA::Client.new(get_options)

    puts "#{Time.now().strftime('%F - %H:%M:%S.%L')}:   Fetching all projects from Jira"
    projects = client.Project.all

    # Iterate through projects and upsert each record to database
    puts "#{Time.now().strftime('%F - %H:%M:%S.%L')}:   Upserting Jira projects to EngIn database"
    i = 0
    while i < projects.count
      puts "#{Time.now().strftime('%F - %H:%M:%S.%L')}:   Project->#{projects[i].name}"
      upsert_project(projects[i])
      i += 1
    end
  end

  private

  # This method upserts a single Jira project into the jira_projects database
  # table.
  def upsert_project(the_project)
    project = JiraProject.find_by(jira_project_id: the_project.id)
    unless project.nil?
      # Record exists, so update it
      project.update(
        name: the_project.name,
        jira_key: the_project.key,
        total_issue_count: 0,
        last_issue_update: DateTime.now,
        self_url: the_project.self
      )
    else
      # Record doesn't exist, so create a new one
      project = JiraProject.create!(
        project_id: 0,
        jira_project_id: the_project.id,
        name: the_project.name,
        jira_key: the_project.key,
        total_issue_count: 0,
        last_issue_update: DateTime.now,
        self_url: the_project.self
      )
      project.save
    end
  end
end
