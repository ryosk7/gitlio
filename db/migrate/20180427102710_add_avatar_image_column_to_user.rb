class AddAvatarImageColumnToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :avatar_image, :string
  end
end
