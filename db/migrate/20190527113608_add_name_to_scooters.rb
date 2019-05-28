class AddNameToScooters < ActiveRecord::Migration[5.2]
  def change
    add_column :scooters, :name, :string
  end
end
