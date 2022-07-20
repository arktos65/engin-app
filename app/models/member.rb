class Member < ApplicationRecord
  belongs_to :role
  belongs_to :department
  belongs_to :source
  has_many :teams

  validates_presence_of :first_name, :last_name
  validates_presence_of :role, :department, :source

end
