class Office < ApplicationRecord
  has_many :trails

  def self.order_created_at
    order(created_at: :desc)
  end

  def count_trails
    trails.count
  end


end
