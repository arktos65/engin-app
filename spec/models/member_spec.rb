require 'rails_helper'

RSpec.describe Member, type: :model do
  my_department = Department.create(name: "Engineering",
                                    division: "Technology",
                                    manager: "John Doe")
  my_source = Source.create(name: "Company",
                            contact: "Jane Doe",
                            contact_email: "jane.doe@company.com")
  my_role = Role.create(name: "Software Engineer",
                        shared: false,
                        administration: false)
  my_currency = Currency.create(symbol: "USD",
                                USDExchange: 1)
  subject {
    described_class.create(first_name: "Jack",
                           last_name: "Smith",
                           role_id: my_role.id,
                           department_id: my_department.id,
                           source_id: my_source.id,
                           start_date: DateTime.now,
                           annual_rate: 100000,
                           weekly_rate: 100000/52,
                           currency_id: my_currency.id,
                           active: true)
  }
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is invalid when Member's first name is missing" do
    subject.first_name = nil
    expect(subject).to_not be_valid
  end
  it "is invalid when Member's last name is missing" do
    subject.last_name = nil
    expect(subject).to_not be_valid
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
  it "should belong to Currency" do
    should belong_to(:currency)
  end
end
