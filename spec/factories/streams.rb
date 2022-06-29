FactoryBot.define do
  factory :stream do
    name { Faker::Business.name }
    stakeholder {  Faker::Name.name }
    stakeholder_email { Faker::Internet.safe_email }
  end
end