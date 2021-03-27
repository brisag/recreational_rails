class Program < ApplicationRecord
  belongs_to :park

  def self.true_virtual_records
    where(virtual: true)
  end
end
