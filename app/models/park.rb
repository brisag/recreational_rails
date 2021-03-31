class Park < ApplicationRecord
  validates :name, :capacity, presence: true
  has_many :programs, dependent: :delete_all

  def self.order_created_at
    order(created_at: :desc)
  end

  def count_programs
    programs.count
  end

  def abc_name
    programs.order(:name)
  end

  def participant_filter(number)
    programs.where('num_of_participants > ?', number)
  end

  def self.search_parks(input)
    where(name: input)
  end

  def self.partial_park(input)
    where("name ILIKE ?", "%#{input}%")
  end

  def self.order_by_number_of_programs
    joins(:programs)
    .group(:id)
    .order('count(programs.id) desc')
  end
end
