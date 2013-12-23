class CreatePrincipals < ActiveRecord::Migration
  def change
    create_table :principals do |t|
      t.string :name
      t.integer :experience
      t.string :email

      t.timestamps
    end
  end
end
