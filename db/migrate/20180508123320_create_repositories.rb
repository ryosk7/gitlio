class CreateRepositories < ActiveRecord::Migration[5.1]
  def change
    create_table :repositories do |t|
      t.belongs_to :user, foreign_key: true
      t.string :name
      t.belongs_to :language, foreign_key: true
      t.integer :star

      t.timestamps
    end
  end
end
