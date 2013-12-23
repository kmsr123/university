class RemoveDetailsFromStudent < ActiveRecord::Migration
  def change
    remove_column :students, :phone, :string
    remove_column :students, :phono, :integer
  end
end
