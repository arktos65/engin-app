class JiraIssuesController < ApplicationController
  include ProjectConnector

  def index
    client = JIRA::Client.new(get_options)
    issues = client.Issue.all
  end

  def show
    client = JIRA::Client.new(get_options)
    isue = client.Issue.find(params[:id])
  end
end
