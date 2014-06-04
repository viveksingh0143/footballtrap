class CreateForms < ActiveRecord::Migration
  def change
    create_table :forms do |t|
      t.string :name, :null => false
      t.string :subject, :null => false
      t.string :email, :null => false
      t.string :phone, :null => false
      t.text :message, :null => false

      t.timestamps
    end
  end
end
