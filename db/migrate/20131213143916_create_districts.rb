class CreateDistricts < ActiveRecord::Migration
  def change
    create_table :districts do |t|
      t.string :name
      t.integer :student_id

      t.timestamps
    end
  end
end
