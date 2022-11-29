class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.references :user, null: false, foreign_key: true
      t.references :foodplace, null: false, foreign_key: true
      t.text :comment
      t.string :highlight
      t.float :rating
      t.date :date
      t.float :cleanliness
      t.float :service

      t.timestamps
    end
  end
end
