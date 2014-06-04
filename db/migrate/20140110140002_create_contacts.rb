class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :uniqid
      t.string :number
      t.string :name
      t.references :device, index: true

      t.timestamps
    end
  end
end
