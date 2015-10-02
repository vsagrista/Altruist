class Transaction < ActiveRecord::Base
	belongs_to :user 
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
end
