class RemoveRatedFromSkills < ActiveRecord::Migration
  def change
  	remove_column :skills, :rated
  end
end
