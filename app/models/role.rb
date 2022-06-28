class Role < ApplicationRecord
  has_many :members

  validates_presence_of :name
end
