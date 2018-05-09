class ChangeColumnToUser < ActiveRecord::Migration[5.1]
  def up
    change_column :users, :repos_info, :text
  end

  def down
    change_column :users, :repos_info, :string
  end
end
