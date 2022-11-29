class AddUpdatedToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :updated, :boolean, default: false
  end
end
