class UsersController < ApplicationController
	before_action :authenticate_user!

	def profile
      @user = current_user
      render 'users/show'
    end

	def index
    @skills = Skill.where(name: params[:name])
    render :index
	end

  def show
    if User.find(params[:id]) == current_user  
      @user = current_user
      @transaction = Transaction.where(user_id: params[:id])   
    else 
    	render :error 
    end
  end

  def edit 
  	@user = User.find(params[:id])
  end

  def update 
    binding.pry
  	User.find(params[:id]).update(user_params)
  	redirect_to user_path(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:name,:about,:phone,:address)
 	end

end
