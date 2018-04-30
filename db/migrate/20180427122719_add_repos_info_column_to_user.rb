class AddReposInfoColumnToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :repos_info, :string
  end
end
