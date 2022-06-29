FactoryBot.define do
  factory :member do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    role_id { nil }
    department_id { nil }
    source_id { nil }
    start_date { Faker::Date.between(from: '2020-09-01', to: '2022-06-29') }
    end_date { nil }
    active { true }
  end
end