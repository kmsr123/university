class AddColumnToAdminUsers < ActiveRecord::Migration
  def change
    add_column :admin_users, :student_id, :integer
  end
end
