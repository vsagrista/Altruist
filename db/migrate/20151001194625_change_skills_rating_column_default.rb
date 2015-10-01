class ChangeSkillsRatingColumnDefault < ActiveRecord::Migration
  def change
  	change_column_default :skills, :rating, 10 
  end
end
