FactoryBot.define do
  factory :team do
    member { nil }
    project { nil }
    annual_rate { 1 }
    weekly_rate { 1 }
    currency { nil }
    start_date { "2022-06-29" }
    end_date { "2022-06-29" }
    allocation { 1 }
  end
end
