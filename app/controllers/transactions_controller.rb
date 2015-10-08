class TransactionsController < ApplicationController
include UsersHelper
  def create
    if current_user.minutes < params[:transaction][:minutes].to_i
      redirect_to :back, :notice => "You don't have enough minutes"
    else
      date_picked = Date.new(params[:transaction]["date(1i)"].to_i,params[:transaction]["date(2i)"].to_i,params[:transaction]["date(3i)"].to_i)
      Transaction.new.create_meeting_and_transaction(current_user.id,params[:user_id],params[:skill_id],params[:transaction][:minutes],date_picked,params[:transaction][:subject])
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
    transaction = Transaction.find(params[:id])
    if transaction.completed
      Transaction.calculate_skill_rating(transaction, params[:transaction][:rating])
      redirect_to user_path(User.find(params[:user_id])), :notice => "Kudos for your altruism! #{User.find(transaction.user_id).name.capitalize} will appreciate your rating and the #{transaction.minutes} min you sent. Thank you :)"
    else
      Transaction.update_transaction_to_completed(transaction)
      redirect_to user_path(User.find(params[:user_id])), :notice => "Kudos for your altruism! #{User.find(transaction.creator_id).name.capitalize} sent you #{transaction.minutes} min, when he rates you, you'll get them :)"
    end
  end

  def show
    @transaction = Transaction.find(params[:id])
  end

end
