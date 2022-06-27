class Role < ApplicationRecord
  validates_presence_of :name

  # Set form default values for this model
  def set_defaults
    self.shared ||= false
    self.administration ||= false
  end
end
