class Trail < ApplicationRecord
  validates :name, :elevation, presence: true
  belongs_to :office

  def self.true_dogs_allowed
    where(dogs_allowed: true)
  end
end
