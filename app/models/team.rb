class Team < ApplicationRecord
  belongs_to :member
  belongs_to :project
  belongs_to :currency

  validates_presence_of :annual_rate, :weekly_rate, :allocation
  validates_presence_of :member, :project, :currency

  before_save :calculate_weekly

  # Calculate the weekly rate by taking annual rate divided by 52 weeks
  def calculate_weekly
    self.weekly_rate = self.annual_rate / 52
  end
end
