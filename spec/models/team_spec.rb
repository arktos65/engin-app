require 'rails_helper'

RSpec.describe Team, type: :model do
  test_department = FactoryBot.create(:department)
  test_source = FactoryBot.create(:source)
  test_stream = FactoryBot.create(:stream)
  test_project = FactoryBot.create(:project, stream_id:test_stream.id)
  test_role = FactoryBot.create(:role)
  test_currency = FactoryBot.create(:currency)
  test_member = FactoryBot.create(:member, role_id: test_role.id, department_id: test_department.id,
                                  source_id: test_department.id)

  test_team = FactoryBot.create(:team, member_id: test_member.id, project_id: test_project.id,
                                currency_id: test_currency.id, weekly_rate: 0)

  it "is valid with valid attributes" do
    expect(test_team).to be_valid
  end
  it "is invalid without annual rate value" do
    test_team.annual_rate = nil
    expect(test_team).to_not be_valid
  end
  it "should belong to a Member" do
    should belong_to(:member)
  end
  it "should belong to a Project" do
    should belong_to(:project)
  end
  it "should belong to a Currency" do
    should belong_to(:currency)
  end
end
