FactoryBot.define do
  factory :currency do
    symbol { Faker::Currency.code }
    USDExchange { Faker::Number.between(from: 1, to: 3) }
  end
end