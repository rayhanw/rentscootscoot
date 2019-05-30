class AddCoordinatesToScooters < ActiveRecord::Migration[5.2]
  def change
    add_column :scooters, :latitude, :float
    add_column :scooters, :longitude, :float
  end
end
