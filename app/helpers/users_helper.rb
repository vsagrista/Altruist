module UsersHelper
  def find_skills_that_match_typed_address(location)
    locations = []
    Skill.all.each do |skill|
      if skill.address.split(",").collect{|x| x.strip}.map(&:downcase).include? location.downcase
        locations << skill
      end
    end
    locations
  end
  def find_skills_on_that_address_that_match_user_search(location_search,skill)
    skills = []
    location_search.each do |item|
      if item.name.downcase == params[:name].downcase
        skills << item
      end
    end
    skills
  end

  def find_creator(transaction)
    return User.find(transaction.creator_id).name.capitalize
  end

  def find_receiver(transaction)
    return User.find(transaction.user_id).name.capitalize
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

end
