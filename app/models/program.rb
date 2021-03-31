class Program < ApplicationRecord
  validates :name, :num_of_participants, presence: true
  belongs_to :park

  def self.true_virtual_records
    where(virtual: true)
  end
end
