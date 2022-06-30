FactoryBot.define do
  factory :department do
    name { Faker::Name.name }
    division { Faker::Business.name }
    manager { Faker::Name.name }
  end
end