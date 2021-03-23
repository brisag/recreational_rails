class AddTrailsToOffice < ActiveRecord::Migration[5.2]
  def change
    add_reference :trails, :office, foreign_key: true
  end
end
