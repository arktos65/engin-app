class Currency < ApplicationRecord
  has_many :teams

  validates_presence_of :symbol
  validates_presence_of :USDExchange

end
