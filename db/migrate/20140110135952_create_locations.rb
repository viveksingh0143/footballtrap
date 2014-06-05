class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.float :latitude
      t.float :longitude
      t.datetime :time
      t.references :device, index: true

      t.timestamps
    end
  end
end
