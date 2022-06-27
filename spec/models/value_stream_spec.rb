require 'rails_helper'

RSpec.describe ValueStream, type: :model do
  subject {
    described_class.new(name: "Software Project",
                        stakeholder: "Jane Doe",
                        stakeholder_email: "jane.done@company.com")
  }
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without value stream name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end
end
