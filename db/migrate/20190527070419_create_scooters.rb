class CreateScooters < ActiveRecord::Migration[5.2]
  def change
    create_table :scooters do |t|
      t.text :description
      t.string :status
      t.string :location
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
