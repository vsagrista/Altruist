class SkillsController < ApplicationController
	before_action :authenticate_user!
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
    	redirect_to user_skills_path
    end


	def new
		@user = User.find(params[:user_id])
		@skill = @user.skills.new	
	end 


	def create 
		Skill.create(name: params[:skill][:name], description: params[:skill][:description], user_id: params[:user_id])
		redirect_to user_skills_path
	end

	def destroy
		Skill.find(params[:id]).destroy
		redirect_to user_skills_path
	end

	private
    def skill_params
      params.require(:skill).permit(:name,:description)
 	end


	
end
