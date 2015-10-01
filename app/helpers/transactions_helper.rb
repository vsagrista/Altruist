module TransactionsHelper
  def update_to_completed(transaction)
    transaction.update(completed: true)
  end

  def calculate_skill_rating(transaction)
    updated_altruist_skill_rating = (Skill.find(transaction.skill_id).rating + params[:transaction][:rating].to_i) / 2
  	Skill.find(transaction.skill_id).update(rating: updated_altruist_skill_rating)
    transaction.update(rated: true)  	
  end

  def change_minutes_in_users(transaction)
  	unless transaction.completed
	  	updated_minutes_altruist = User.find(transaction.user_id).minutes + transaction.minutes
	  	User.find(transaction.user_id).update(minutes: updated_minutes_altruist)
	end
  end
end
