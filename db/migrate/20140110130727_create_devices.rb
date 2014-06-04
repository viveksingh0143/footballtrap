class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :name, :null => false
      t.string :imei, :null => false
      t.string :serial_number
      t.string :devise_type, :null => false
      t.string :os
      t.string :hardware_platform
      t.string :platform_string
      t.string :total_memory
      t.string :total_disk
      t.string :free_disk_space
      t.references :user, index: true
      t.index [:imei], :unique => true
      t.timestamps
    end
  end
end
