class SkillsController < ApplicationController
	def index 
		@user = User.find(params[:user_id])
		@skills = @user.skills
	end

	def show 
		@user = User.find(params[:user_id])
		@skill = @user.skills.where(id: params[:id])[0]
	end

	def edit
		@user = User.find(params[:user_id])
		@skill = @user.skills.find(params[:id])
	end

	def update 
    	skill = User.find(params[:user_id]).skills.where(id: params[:id])
    	skill[0].update(skill_params)
    	binding.pry	
    end


	def new 
	  @skill = Skill.new 
	end 

	def create 

	end 
	private
    def skill_params
      params.require(:skill).permit(:name,:description)
 	end


	
end
