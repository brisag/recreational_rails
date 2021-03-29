class Trail < ApplicationRecord
  belongs_to :office

  def self.true_dogs_allowed
    where(dogs_allowed: true)
  end

  def self.elevation_greater_than(number)
    where("elevation > #{number}")
  end
end
