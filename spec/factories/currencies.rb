FactoryBot.define do
  factory :currency do
    symbol { Faker::Currency.code }
    USDExchange { Faker::Number.between(1..3) }
  end
end