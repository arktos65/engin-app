FactoryBot.define do
  factory :currency do
    symbol { Faker::Finance.ticker }
    USDExchange { Faker::Number.between(1..3) }
  end
end