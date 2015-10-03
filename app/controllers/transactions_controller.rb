class TransactionsController < ApplicationController
	include TransactionsHelper
	def create 
		if current_user.minutes < params[:transaction][:minutes].to_i
			redirect_to :back, :notice => "You don't have enough minutes"
		else
		Transaction.create(creator_id: current_user.id, user_id: params[:user_id], skill_id: params[:skill_id], minutes: params[:transaction][:minutes]) 	
			redirect_to user_path(current_user), :notice => 
			"Your invitation to #{User.find(params[:user_id]).name.capitalize} (#{params[:transaction][:minutes]} min, skill: #{Skill.find(params[:skill_id]).name} ) has been delivered :)"
	    end
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
	end
	def show 
		@transaction = Transaction.find(params[:id])
	end

end
