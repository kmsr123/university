class RemoveColumnFromStudent < ActiveRecord::Migration
  def change
    remove_column :students, :district_id, :integer
  end
end
