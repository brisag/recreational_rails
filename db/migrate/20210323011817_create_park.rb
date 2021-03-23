class CreatePark < ActiveRecord::Migration[5.2]
  def change
    create_table :parks do |t|
      t.string :name
      t.integer :capacity
      t.boolean :permit_required
    end
  end
end
