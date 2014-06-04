class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :latitude
      t.string :longitude
      t.datetime :time
      t.references :device, index: true

      t.timestamps
    end
  end
end
