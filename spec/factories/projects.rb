FactoryBot.define do
  factory :project do
    stream_id { nil }
    name { Faker::App.name }
    internal { false }
    start_date { Faker::Date.backward(days: 60) }
    end_date { nil }
    active { true }
    jira_project_id { Faker::Number.between(from: 1000, to: 5000) }
    jira_project_name { Faker::App.name }
  end
end