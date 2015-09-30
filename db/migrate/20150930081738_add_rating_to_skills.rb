class AddRatingToSkills < ActiveRecord::Migration
  def change
  	add_column :skills, :rating, :integer, :default => 0
  end
end
