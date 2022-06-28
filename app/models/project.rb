class Project < ApplicationRecord
  belongs_to :stream

  validates_presence_of :stream, :name
end
