class RemoveReposInfoFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :repos_info, :text
  end
end
