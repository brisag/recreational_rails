class Park < ApplicationRecord
  has_many :programs

  def self.order_created_at
    order(created_at: :desc)
  end
end
