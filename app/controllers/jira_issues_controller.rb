class JiraIssuesController < ApplicationController
  include ProjectConnector

  # GET /jira/project/:id/issues
  def index
    client = JIRA::Client.new(get_options)
    @project = client.Project.find(params[:jira_project_id])
    @issues = @project.issues
  end

  # GET /jira/issue/:id
  def show
    client = JIRA::Client.new(get_options)
    @issue = client.Issue.find(params[:id])
  end
end
