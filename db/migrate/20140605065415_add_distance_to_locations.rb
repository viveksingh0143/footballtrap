class AddDistanceToLocations < ActiveRecord::Migration
  def change
    change_column :locations, :latitude, 'float USING CAST(latitude AS float)'
    change_column :locations, :longitude, 'float USING CAST(longitude AS float)'
    add_column :locations, :travel, :float
    add_index :locations, [:latitude, :longitude]
  end
end
