class Stream < ApplicationRecord
  has_many :projects

  validates_presence_of :name
end
