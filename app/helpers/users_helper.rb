module UsersHelper

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
