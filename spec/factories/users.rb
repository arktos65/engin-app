FactoryBot.define do
  factory :user do
    email { Faker::Internet.safe_email }
    password_digest { "MyString" }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    remember_token { "MyString" }
    remember_token_expires_at { Faker::DateTime.forward(days: 30) }
  end
end
