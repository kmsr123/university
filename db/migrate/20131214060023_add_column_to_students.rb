class AddColumnToStudents < ActiveRecord::Migration
  def change
    add_column :students, :phono, :string
  end
end
