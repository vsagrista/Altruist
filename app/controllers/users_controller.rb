class UsersController < ApplicationController
	before_action :authenticate_user!

	def profile
      @user = current_user
      redirect_to user_path(@user)
    end

	def index
    @skills = []
    if !params[:name].nil? && !params[:address].nil?
      if !params[:name].empty? &&  !params[:address].empty?
        location_search = Skill.where("address like ?", "%" + params[:address] + "%")
        location_search.each do |item|
          if item.name == params[:name]
            @skills << item
          end
        end
      end
    end
    render :index
	end

  def show
    if User.find(params[:id]) == current_user  
      @user = current_user
      @transaction_received = Transaction.where(user_id: params[:id])
      @transaction_created = Transaction.where(creator_id: params[:id])
      @transaction_completed = Transaction.where(user_id: params[:id], completed: true)
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
