class AddAddressColumnToSkill < ActiveRecord::Migration
  def change
  	add_column :skills, :address, :text
  end
end
