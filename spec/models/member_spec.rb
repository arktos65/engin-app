require 'rails_helper'

RSpec.describe Member, type: :model do
  test_department = FactoryBot.create(:department)
  test_source = FactoryBot.create(:source)
  test_role = FactoryBot.create(:role)

  test_member = FactoryBot.create(:member, department_id: test_department.id, role_id: test_role.id,
                  source_id: test_source.id)

  it "is valid with valid attributes" do
    expect(test_member).to be_valid
  end
  it "is invalid when Member's first name is missing" do
    test_member.first_name = nil
    expect(test_member).to_not be_valid
  end
  it "is invalid when Member's last name is missing" do
    test_member.last_name = nil
    expect(test_member).to_not be_valid
  end
  it "should belong to Department" do
    should belong_to(:department)
  end
  it "should belong to Source" do
    should belong_to(:source)
  end
  it "should belong to Role" do
    should belong_to(:role)
  end
end
