class Currency < ApplicationRecord
  validates_presence_of :symbol
  validates_presence_of :USDExchange
end
