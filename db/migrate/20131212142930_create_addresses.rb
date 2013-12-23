class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :state
      t.string :district
      t.string :town
      t.string :zipcode
      t.string :village
      t.integer :addressable_id
      t.string :addressable_type

      t.timestamps
    end
  end
end
