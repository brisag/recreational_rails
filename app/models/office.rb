class Office < ApplicationRecord
  validates :name, :capacity, presence: true
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

  def elevation_filter(number)
    trails.where('elevation > ?', number)
  end

  def self.search_offices(input)
    where(name: input)
  end

  def self.partial_search(input)
    where("name ILIKE ?", "%input%")
  end
end
