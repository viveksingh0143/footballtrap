class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title, :null => false
      t.string :slug, :null => false
      t.text :body

      t.timestamps
      
      t.index [:slug], :unique => true
    end
  end
end
