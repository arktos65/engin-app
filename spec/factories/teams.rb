FactoryBot.define do
  factory :team do
    member_id { nil }
    project_id { nil }
    annual_rate { Faker::Number.between(80000..130000) }
    weekly_rate { nil }
    currency_id { nil }
    start_date { Faker::Date.backward(days: 45) }
    end_date { nil }
    allocation { 100 }
  end
end
