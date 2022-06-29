FactoryBot.define do
  factory :project do
    stream_id { nil }
    name { Faker::App.name }
    internal { false }
    start_date { Faker::Date.backward(days: 60) }
    end_date { nil }
    active { true }
  end
end