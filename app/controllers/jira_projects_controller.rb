include JiraConnect

class JiraProjectsController < ApplicationController
  def index
    client = JIRA::Client.new(JiraConnect.get_connector)
    projects = client.Project.all
  end

  def show
    client = JIRA::Client.new(JiraConnect.get_connector)
    project = client.Issue.find(params[:id])
  end
end
