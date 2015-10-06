module TransactionsHelper
  def create_meeting_and_transaction(creator,user,skill,minutes,date,subject)
      meeting = Meeting.new
      transaction = Transaction.create(creator_id: creator, user_id: user, skill_id: skill, minutes: minutes, date: date, subject: subject)
      meeting.transaction_id = transaction.id 
      meeting.start_time = transaction.date 
      meeting.save
  end

  
  def update_to_completed(transaction)
    transaction.update(completed: true)
    redirect_to user_path(User.find(params[:user_id])), :notice => "Kudos for your altruism! #{User.find(transaction.creator_id).name.capitalize} sent you #{transaction.minutes} min, when he rates you, you'll get them :)"
  end

  def calculate_skill_rating(transaction)
    if Skill.find(transaction.skill_id).rating == 0
      Skill.find(transaction.skill_id).update(rating: params[:transaction][:rating].to_i)
    else 
      updated_altruist_skill_rating = (Skill.find(transaction.skill_id).rating + params[:transaction][:rating].to_i) / 2
      Skill.find(transaction.skill_id).update(rating: updated_altruist_skill_rating)
    end
    transaction.update(rating: params[:transaction][:rating].to_i,  rated: true) 	
    update_altruists_minutes(transaction)
    redirect_to user_path(User.find(params[:user_id])), :notice => "Kudos for your altruism! #{User.find(transaction.user_id).name.capitalize} will appreciate your rating and the #{transaction.minutes} min you sent. Thank you :)"
  end

  def update_altruists_minutes(transaction)
    User.find(transaction.creator_id).update(minutes: (User.find(transaction.creator_id).minutes -= transaction.minutes))
    User.find(transaction.user_id).update(minutes: (User.find(transaction.user_id).minutes += transaction.minutes))
  end
end
