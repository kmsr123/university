class CreateSemisters < ActiveRecord::Migration
  def change
    create_table :semisters do |t|
      t.string :semister_name
      t.string :month

      t.timestamps
    end
  end
end
