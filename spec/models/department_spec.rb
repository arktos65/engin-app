require 'rails_helper'

RSpec.describe Department, type: :model do
  it "is valid with valid attributes" do
    department = Department.new
    department.name = "Engineering"
    department.division = "Technology"
    department.manager = "Mary Smith"
    expect(department).to be_valid
  end
  it "is not valid without a department name" do
    department = Department.new(name: nil)
    expect(department).to_not be_valid
  end
end
