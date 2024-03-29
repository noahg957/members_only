class AddAssociations < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :username, :string
    add_index :users, :username, unique: true
    add_column :posts, :user_id, :integer
  end
end
