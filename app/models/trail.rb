class Trail < ApplicationRecord
  belongs_to :office

  validates_presence_of :name

  def self.true_dogs_allowed
    where(dogs_allowed: true)
  end

  # def self.count_the_trails
  #   count
  # end
  #class_method = @office.trails.count_the_trails.
end
