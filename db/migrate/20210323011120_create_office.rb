class CreateOffice < ActiveRecord::Migration[5.2]
  def change
    create_table :offices do |t|
      t.string :name
      t.integer :capacity
      t.boolean :first_aid

      t.timestamps
    end
  end
end
