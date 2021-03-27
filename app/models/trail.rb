class Trail < ApplicationRecord
  belongs_to :office

  validates_presence_of :name 

  # def self.count_the_trails
  #   count
  # end
  #class_method = @office.trails.count_the_trails.
end
