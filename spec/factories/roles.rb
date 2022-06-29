FactoryBot.define do
  factory :role do
    name { Faker::Job.title }
    shared { false }
    administration { false }
  end
end