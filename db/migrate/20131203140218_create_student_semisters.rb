class CreateStudentSemisters < ActiveRecord::Migration
  def change
    create_table :student_semisters do |t|
      t.integer :student_id
      t.integer :semister_id

      t.timestamps
    end
  end
end
