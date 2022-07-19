class Currency < ApplicationRecord
  has_many :members

  validates_presence_of :symbol
  validates_presence_of :USDExchange

end
