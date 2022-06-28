class Member < ApplicationRecord
  belongs_to :role
  belongs_to :department
  belongs_to :source
  belongs_to :currency

  validates_presence_of :first_name, :last_name
  validates_presence_of :role, :department, :source, :currency
end
