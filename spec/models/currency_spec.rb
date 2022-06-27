require 'rails_helper'

RSpec.describe Currency, type: :model do
  subject {
    described_class.new(symbol: "EUR",
                        USDExchange: 1.00)
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without currency symbol name" do
    subject.symbol = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without an USD exchange rate value" do
    subject.USDExchange = nil
    expect(subject).to_not be_valid
  end
end
