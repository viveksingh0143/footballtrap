class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.string :uniqid
      t.references :contact
      t.string :log_type
      t.datetime :time
      t.decimal :duration
      t.references :device, index: true

      t.timestamps
    end
  end
end
