class AddColumnsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :nickname, :string
    add_column :users, :diet, :string
    add_column :users, :likes, :string
    add_column :users, :allergies, :string
    add_column :users, :dislikes, :string
    add_column :users, :bio, :text
  end
end
