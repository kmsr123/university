class AddColumnToTeacher < ActiveRecord::Migration
  def change
    add_column :teachers, :subjects, :string
  end
end
