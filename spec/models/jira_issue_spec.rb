require 'rails_helper'

RSpec.describe JiraIssue, type: :model do
  test_stream  = FactoryBot.create(:stream)
  test_project = FactoryBot.create(:project, stream_id: test_stream.id)

  test_jira_project = FactoryBot.create(:jira_project, project_id: test_project.id)

  test_issue = FactoryBot.create(:jira_issue,
                                 jira_project_id: test_jira_project.id)

  # Test attribute validity
  # Test for validity of attributes
  it "is valid with valid attributes" do
    expect(test_issue).to be_valid
  end
  it "is invalid without Jira Project Id" do
    test_issue.jira_project_id = nil
    expect(test_issue).to_not be_valid
  end
  it "is invalid without Issue Key" do
    test_issue.issue_key = nil
    expect(test_issue).to_not be_valid
  end
  it "is invalid without Issue URL" do
    test_issue.issue_url = nil
    expect(test_issue).to_not be_valid
  end
  it "is invalid without Issue Title" do
    test_issue.issue_title = nil
    expect(test_issue).to_not be_valid
  end
  it "is invalid without Issue Status" do
    test_issue.issue_status = nil
    expect(test_issue).to_not be_valid
  end
  it "is invalid without Issue Type" do
    test_issue.issue_type = nil
    expect(test_issue).to_not be_valid
  end

  # Test associations
  it "should belong to a Jira Project" do
    should belong_to(:jira_project)
  end
end
