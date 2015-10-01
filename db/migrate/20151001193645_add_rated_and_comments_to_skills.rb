class AddRatedAndCommentsToSkills < ActiveRecord::Migration
  def change
  	add_column :skills, :comments, :text
  	add_column :skills, :rated, :boolean, :default => false
  end
end
