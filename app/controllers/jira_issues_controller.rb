class JiraIssuesController < ApplicationController
  def index
    client = JIRA::Client.new(JiraConnect.get_connector)
    issues = client.Issue.all
  end

  def show
    client = JIRA::Client.new(JiraConnect.get_connector)
    isue = client.Issue.find(params[:id])
  end
end
