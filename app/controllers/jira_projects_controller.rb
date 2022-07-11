class JiraProjectsController < ApplicationController
  include ProjectConnector

  def index
    client = JIRA::Client.new(get_options)
    projects = client.Project.all
  end

  def show
    client = JIRA::Client.new(get_options)
    project = client.Issue.find(params[:id])
  end
end
