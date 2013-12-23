class RemoveColumnFromDistrict < ActiveRecord::Migration
  def change
    remove_column :districts, :student_id, :integer
  end
end
