class AddPhotoToUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :photo
  end
end
