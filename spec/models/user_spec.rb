require 'rails_helper'

RSpec.describe User, type: :model do
  test_user = User.create(email: Faker::Internet.safe_email, password: "password",
                          first_name: Faker::Name.first_name , last_name: Faker::Name.last_name)

  it "is valid with valid attributes" do
    expect(test_user).to be_valid
  end
end
