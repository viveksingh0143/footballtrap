class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, :null => false
      t.string :email, :null => false
      t.string :encrypted_password, :null => false
      t.string :salt, :null => false
      t.integer :status, :default => 0, :null => false
      t.boolean :admin, :default => false, :null => false
      t.timestamps

      t.index [:username], :unique => true
      t.index [:email], :unique => true
      t.index [:username, :status]
    end
  end
end