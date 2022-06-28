require 'rails_helper'

RSpec.describe Project, type: :model do
  vs = Stream.create(name: "Value Stream 1",
                     stakeholder: "Jane Doe",
                     stakeholder_email: "jane.doe@company.com")
  subject {
    described_class.create(name: "Project 1",
                        stream_id: vs.id,
                        internal: false,
                        start_date: DateTime.now,
                        end_date: DateTime.now + 3.months,
                        active: true)
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is invalid without a Project name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  it "should belong to a Stream" do
    should belong_to(:stream)
  end
end
