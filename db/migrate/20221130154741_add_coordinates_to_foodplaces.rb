class AddCoordinatesToFoodplaces < ActiveRecord::Migration[7.0]
  def change
    add_column :foodplaces, :latitude, :float
    add_column :foodplaces, :longitude, :float
  end
end
