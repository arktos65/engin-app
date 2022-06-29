FactoryBot.define do
  factory :source do
    name { Faker::Business.name }
    contact { Faker::Name.name }
    contact_title { Faker::Job.title }
    contact_phone { Faker::PhoneNumber }
    contact_email { Faker::Internet.safe_email }
  end
end