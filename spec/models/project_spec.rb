require 'rails_helper'

RSpec.describe Project, type: :model do
  test_stream  = FactoryBot.create(:stream)
  test_project = FactoryBot.create(:project, stream_id: test_stream.id)

  it "is valid with valid attributes" do
    expect(test_project).to be_valid
  end
  it "is invalid without a Project name" do
    test_project.name = nil
    expect(test_project).to_not be_valid
  end
  it "should belong to a Stream" do
    should belong_to(:stream)
  end
end
