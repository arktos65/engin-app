include "jira-ruby"

module IssuesLoader
  include ProjectConnector

  # Update project issues by iterating through each project registered
  # in Jira and upserting to the jira_issues table.
  def update_all_issues
    client = JIRA::Client.new(get_options)
    projects = client.Project.all

    # Iterate through projects and upsert each record to database
    i = 0
    while i < projects.count
      issues = projects[i].issues
      puts "Project: #{projects[i].name} -> Issue Count: #{issues.count}"
      unless issues.nil?
        upsert_issues(issues, projects[i].id)
      end
      i += 1
    end
  end

  # Update the issues for a single project by fetching the issues associated
  # with the specified project id and upserting to the jira_issues table.
  def update_project_issues(project_id)
    client = JIRA::Client.new(get_options)
    issues = client.Issue.find(params[:project_id])
  end

  private

  # Return a collection of issues for the specified Jira project id
  def get_project_issues(project, client)
    issues = project.issues
    return issues
  end

  # This method upserts a single Jira project issue into the jira_issues
  # database table.
  def upsert_issues(issues, project_id)
    i = 0
    while i < issues.count
      issue = JiraIssue.find_by(id: issues[i].id)
      issue.create!(
        jira_issue_id: issues[i].id,
        jira_project_id: project_id,
        issue_key: issues[i].key,
        issue_url: issues[i].self,
        issue_title: issues[i].summary,
        issue_status: issues[i].status,
        issue_type: issues[i].type,
        story_points: issues[i].estimate,
        issue_created: issues[i].created,
        issue_updated: issues[i].updated) if issue.nil?
      issue.update!(
        jira_issue_id: issues[i].id,
        issue_key: issues[i].key,
        issue_url: issues[i].self,
        issue_title: issues[i].summary,
        issue_status: issues[i].status,
        issue_type: issues[i].type,
        story_points: issues[i].estimate,
        issue_created: issues[i].created,
        issue_updated: issues[i].updated) unless issue.nil?
      issue.save
      i += 1
    end
  end
end
