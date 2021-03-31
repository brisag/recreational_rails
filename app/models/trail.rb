class Trail < ApplicationRecord
  validates :name, :elevation, presence: true
  validates :dogs_allowed, inclusion: [true, false]
  belongs_to :office

  def self.true_dogs_allowed
    where(dogs_allowed: true)
  end
end
