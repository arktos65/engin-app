require 'rails_helper'

RSpec.describe JiraProject, type: :model do
  test_stream  = FactoryBot.create(:stream)
  test_project = FactoryBot.create(:project, stream_id: test_stream.id)

  test_jira_project = FactoryBot.create(:jira_project, project_id: test_project.id)

  # Test for validity of attributes
  it "is valid with valid attributes" do
    expect(test_jira_project).to be_valid
  end
  it "is invalid without Jira Project Name" do
    test_jira_project.name = nil
    expect(test_jira_project).to_not be_valid
  end
  it "is invalid without Jira Project Key" do
    test_jira_project.jira_key = nil
    expect(test_jira_project).to_not be_valid
  end
  it "is invalid without Self URL" do
    test_jira_project.self_url = nil
    expect(test_jira_project).to_not be_valid
  end

  # Test associations
  it "should belong to a Project" do
    should belong_to(:project)
  end
end
