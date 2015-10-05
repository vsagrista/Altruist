class TransactionsController < ApplicationController
	include TransactionsHelper
	def create 
		if current_user.minutes < params[:transaction][:minutes].to_i
			redirect_to :back, :notice => "You don't have enough minutes"
		else
			date_picked = Date.new(params[:transaction]["date(1i)"].to_i,params[:transaction]["date(2i)"].to_i,params[:transaction]["date(3i)"].to_i)
			create_meeting_and_transaction(current_user.id,params[:user_id],params[:skill_id],params[:transaction][:minutes],date_picked)
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

	