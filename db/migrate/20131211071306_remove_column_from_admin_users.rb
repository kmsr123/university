class RemoveColumnFromAdminUsers < ActiveRecord::Migration
  def change
    remove_column :admin_users, :student_id, :integer
  end
end
