require 'rails_helper'

RSpec.describe Role, type: :model do
  subject {
    described_class.new(name: "Software Engineer I",
                        shared: false,
                        administration: false)
  }
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without a role name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end
end
