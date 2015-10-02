class TransactionsController < ApplicationController
	include TransactionsHelper
	def create 
		Transaction.create(creator_id: current_user.id, user_id: params[:user_id], skill_id: params[:skill_id], minutes: params[:transaction][:minutes]) 	
		redirect_to user_skill_path(params[:user_id],params[:skill_id])
	end

	def edit 
		@user = User.find(params[:user_id])
		@skill = Skill.find(params[:skill_id])
		@transaction = Transaction.find(params[:id])
	end
	def update 
		if Transaction.find(params[:id]).completed 
			calculate_skill_rating(Transaction.find(params[:id]))
		else 
			update_to_completed(Transaction.find(params[:id])) 
		end
		redirect_to user_path(User.find(params[:user_id]))
	end
	def show 
		@transaction = Transaction.find(params[:id])
	end

end
