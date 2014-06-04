class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :uniqid
      t.string :title
      t.datetime :capture
      t.string :url
      t.references :device, index: true

      t.timestamps
    end
  end
end
