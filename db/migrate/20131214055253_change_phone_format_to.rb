class ChangePhoneFormatTo < ActiveRecord::Migration
  def change
 
  change_column :students, :phone, :string

 end
end
