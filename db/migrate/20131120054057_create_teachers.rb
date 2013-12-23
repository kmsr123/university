class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :full_name
      t.string :gender
      t.integer :experience
      t.decimal :salary
      t.integer :phone
      t.string :email

      t.timestamps
    end
  end
end
