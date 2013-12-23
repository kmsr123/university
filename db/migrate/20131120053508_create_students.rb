class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :full_name
      t.string :fathername
      t.string :gender
      t.date :dob
      t.integer :age
      t.string :class
      t.decimal :fee
      t.integer :phono
      t.string :email

      t.timestamps
    end
  end
end
