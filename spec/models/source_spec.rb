require 'rails_helper'

RSpec.describe Source, type: :model do
  subject {
    described_class.new(name: "Company A",
                        contact: "John Doe",
                        contact_title: "Account Executive",
                        contact_phone: "555-555-5555",
                        contact_email: "john.doe@company.com")
  }
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is invalid without a source name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  it "is invalid without a contact" do
    subject.contact = nil
    expect(subject).to_not be_valid
  end
  it "is invalid without a contact email address" do
    subject.contact_email = nil
    expect(subject).to_not be_valid
  end
end
