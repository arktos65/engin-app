class JiraProjectsController < ApplicationController
  include ProjectConnector

  # GET /jira/projects
  def index
    client = JIRA::Client.new(get_options)
    @projects = client.Project.all
  end

  # GET /jira/projects/:id
  def show
    client = JIRA::Client.new(get_options)
    @project = client.Issue.find(params[:id])
  end
end
