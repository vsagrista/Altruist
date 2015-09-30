class AddRatingToSkills < ActiveRecord::Migration
  def change
  	add_column :skills, :rating, :integer
  end
end
