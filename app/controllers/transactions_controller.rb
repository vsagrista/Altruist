class TransactionsController < ApplicationController
	def new 
		Transaction.create(creator_id: current_user.id, user_id: params[:user_id], skill_id: params[:skill_id]) 	
		#redirect_to url_for(:controller => :skills, :action => :show)
		redirect_to user_skill_path(params[:user_id],params[:skill_id])
	end

	def create
		binding.pry
	end
end
