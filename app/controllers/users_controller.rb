class UsersController < ApplicationController
  include UsersHelper
  before_action :authenticate_user!

  def profile
    @user = current_user
    redirect_to user_path(@user)
  end

  def index
    @skills = []
    if !params[:name].nil? && !params[:address].nil?
      if !params[:name].empty? &&  !params[:address].empty?
        location_search = find_skills_that_match_typed_address(params[:address])
        @skills = find_skills_on_that_address_that_match_user_search(location_search,params[:name])
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

  private
  def user_params
    params.require(:user).permit(:name,:about,:phone,:address)
  end

end
