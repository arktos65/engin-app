class JiraIssuesController < ApplicationController
  include ProjectConnector

  # GET /jira/project/:id/issues
  def index
    client = JIRA::Client.new(get_options)
    issues = client.Issue.all
  end

  # GET /jira/project/:id/issue/:id
  def show
    client = JIRA::Client.new(get_options)
    isue = client.Issue.find(params[:id])
  end
end
