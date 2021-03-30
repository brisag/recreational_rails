class Office < ApplicationRecord
  has_many :trails, dependent: :delete_all

  def self.order_created_at
    order(created_at: :desc)
  end

  def count_trails
    trails.count
  end

  def abc_name
    trails.order(:name)
  end
end
