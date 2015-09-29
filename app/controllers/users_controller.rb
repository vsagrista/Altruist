class UsersController < ApplicationController
	before_action :authenticate_user!

	def profile
      @user = current_user
      render 'users/show'
    end

	def index
		@users = User.all.order("rating DESC")
		#@sorted_bids = @product.bids.order("amount DESC")
	end

    def show
      if User.find(params[:id]) == current_user 
        @user = current_user
      else 
      	render :error 
      end
    end

    def edit 
    	@user = User.find(params[:id])
    end

    def update 
    	User.find(params[:id]).update(user_params)
    	redirect_to user_path(params[:id])
    end

    private
    def user_params
      params.require(:user).permit(:name,:about,:phone,:address)
 	end

end
