require 'rails_helper'

RSpec.describe "JiraProjects", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/jira_projects/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/jira_projects/show"
      expect(response).to have_http_status(:success)
    end
  end

end
