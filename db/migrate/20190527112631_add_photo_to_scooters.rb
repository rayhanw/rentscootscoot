class AddPhotoToScooters < ActiveRecord::Migration[5.2]
  def change
    add_column :scooters, :photo, :string
  end
end
