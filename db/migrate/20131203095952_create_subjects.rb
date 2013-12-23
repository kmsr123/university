class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.integer :semister_id
      t.integer :c_language
      t.integer :ruby
      t.integer :rails
      t.integer :datastructers
      t.integer :java

      t.timestamps
    end
  end
end
