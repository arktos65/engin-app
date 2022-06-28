class Department < ApplicationRecord
  has_many :members

  validates_presence_of :name
end
