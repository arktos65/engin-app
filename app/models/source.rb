class Source < ApplicationRecord
  has_many :members

  validates_presence_of :name
  validates_presence_of :contact
  validates_presence_of :contact_email
end
