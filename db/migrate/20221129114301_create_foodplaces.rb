class CreateFoodplaces < ActiveRecord::Migration[7.0]
  def change
    create_table :foodplaces do |t|
      t.string :name
      t.string :address
      t.string :phone_number
      t.string :type
      t.string :cuisine
      t.string :website
      t.float :google_rating
      t.date :opening_times

      t.timestamps
    end
  end
end
