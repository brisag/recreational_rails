class Park < ApplicationRecord
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
end
