class UsersController < ApplicationController
  include UsersHelper
  before_action :authenticate_user!
  
  def profile
    @user = current_user
    redirect_to user_path(@user)
  end

  def index
    if !params[:name].nil? && !params[:address].nil?
      if !params[:name].empty? &&  !params[:address].empty?
        location_search = User.new.find_skills_that_match_typed_address(params[:address])
        @skills = User.find_skills_on_that_address_that_match_user_search(location_search,params[:name])
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
      @any_created_transaction_pending = @transaction_created.select { |t| !t.completed }.any?
      @meetings = Meeting.all
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

  def display 
    skills = User.new.find_skills_that_match_typed_address(params[:city].split(" ").join)
    @city = params[:city].split(" ").join
    @skills = skills.map { |h| h['name'] }.uniq
    @skills_popularity = User.new.get_how_many_users_have_that_skill(skills)
  end

  private
  def user_params
    params.require(:user).permit(:name,:about,:phone,:address)
  end

end
