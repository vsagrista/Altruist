module UsersHelper

  def find_creator(transaction)
    return User.find(transaction.creator_id).name.capitalize
  end

  def find_receiver(transaction)
    return User.find(transaction.user_id).name.capitalize
  end

  def find_receiver_from_skill(skill)
    return User.find(skill.user_id).name 
  end

  def find_transaction_from_date(date)
    return Transaction.where(date: date)
  end

  def find_transactions_where_user_is_receiver(user_id)
    return Transaction.where(user_id: user_id)
  end

  def find_transactions_where_user_is_creator(user_id)
    return Transaction.where(creator_id: user_id)
  end

  def get_all_skills_with_unique_cities
    skills_by_city = Skill.all.each do |skill| 
        skill.address = skill.address.split(",")[1] 
    end
    @cities = skills_by_city.map { |h| h['address']}.uniq.compact 
  end

  def get_skills_sorted_by_rating 
    Skill.all.sort_by { |value| value[:rating] }.reverse
  end

end
