class Transaction < ActiveRecord::Base
  belongs_to :user
  belongs_to :meeting
  validates :creator_id, :user_id, :skill_id, presence: true
  validate :is_own_skill?, :user_has_enough_minutes?

  def is_own_skill?
    if self.creator_id == self.user_id
      errors.add(:base, "Same user error")
    end
  end
  
  def user_has_enough_minutes?
    if User.find(self.creator_id).minutes < self.minutes
      errors.add(:base, "You don't have enough minutes!")
    end
  end

  def create_meeting_and_transaction(creator,user,skill,minutes,date,subject)
    meeting = Meeting.new
    transaction = Transaction.create(creator_id: creator, user_id: user, skill_id: skill, minutes: minutes, date: date, subject: subject)
    meeting.transaction_id = transaction.id
    meeting.start_time = transaction.date
    meeting.save
  end

  def self.update_transaction_to_completed(transaction)
    transaction.update(completed: true)
  end

  def self.calculate_skill_rating(transaction, rating)
    if Skill.find(transaction.skill_id).rating == 0
      Skill.find(transaction.skill_id).update(rating: rating.to_i)
    else
      updated_altruist_skill_rating = (Skill.find(transaction.skill_id).rating + rating.to_i) / 2
      Skill.find(transaction.skill_id).update(rating: updated_altruist_skill_rating)
    end
    transaction.update(rating: rating.to_i,  rated: true)
    update_altruists_minutes(transaction)
  end

  def self.update_altruists_minutes(transaction)
    User.find(transaction.creator_id).update(minutes: (User.find(transaction.creator_id).minutes -= transaction.minutes))
    User.find(transaction.user_id).update(minutes: (User.find(transaction.user_id).minutes += transaction.minutes))
  end
end
