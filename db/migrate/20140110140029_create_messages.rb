class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :uniqid
      t.references :contact
      t.string :msg_type
      t.text :message
      t.datetime :time
      t.references :device, index: true

      t.timestamps
    end
  end
end
