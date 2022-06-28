require 'rails_helper'

RSpec.describe Stream, type: :model do
  subject {
    described_class.new(name: "Stream 1",
                        stakeholder: "Jane Doe",
                        stakeholder_email: "jane.doe@company.com")
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is invalid without Stream name attribute" do
    subject.name = nil
    expect(subject).to_not be_valid
  end
end
