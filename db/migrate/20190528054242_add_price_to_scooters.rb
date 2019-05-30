class AddPriceToScooters < ActiveRecord::Migration[5.2]
  def change
    add_column :scooters, :price, :integer
  end
end
