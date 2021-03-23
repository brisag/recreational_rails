class CreatePrograms < ActiveRecord::Migration[5.2]
  def change
    create_table :programs do |t|
      t.string :name
      t.integer :num_of_participants
      t.boolean :virtual
      t.references :park, foreign_key: true

      t.timestamps
    end
  end
end
