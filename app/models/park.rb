class Park < ApplicationRecord
  has_many :programs, dependent: :delete_all

  def self.order_created_at
    order(created_at: :desc)
  end

  def count_programs
    programs.count
  end

  def order_programs_abc
    programs.order(:name)
  end
end
