class CreateApps < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.string :program
      t.string :version
      t.string :package
      t.references :device, index: true

      t.timestamps
    end
  end
end
