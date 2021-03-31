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

  def self.partial_office(input)
    where("name ILIKE ?", "%#{input}%")
  end

  def self.order_by_number_of_trails
    joins(:trails)
    .group(:id)
    .order('count(trails.id) desc')
  end
end
