class AddColumnToDistricts < ActiveRecord::Migration
  def change
    add_column :districts, :state_id, :integer
  end
end
