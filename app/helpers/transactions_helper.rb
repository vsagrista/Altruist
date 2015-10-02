module TransactionsHelper
  def update_to_completed(transaction)
    transaction.update(completed: true)
  end

  def calculate_skill_rating(transaction)
    if Skill.find(transaction.skill_id).rating == nil
      Skill.find(transaction.skill_id).update(rating: params[:transaction][:rating].to_i)
    else 
      updated_altruist_skill_rating = (Skill.find(transaction.skill_id).rating + params[:transaction][:rating].to_i) / 2
      Skill.find(transaction.skill_id).update(rating: updated_altruist_skill_rating)
    end
    transaction.update(rating: params[:transaction][:rating].to_i,  rated: true) 	
    update_altruists_minutes(transaction)
  end

  def update_altruists_minutes(transaction)
    User.find(transaction.creator_id).update(minutes: (User.find(transaction.creator_id).minutes -= transaction.minutes))
    User.find(transaction.user_id).update(minutes: (User.find(transaction.user_id).minutes += transaction.minutes))
  end
end
