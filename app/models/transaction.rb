class Transaction < ActiveRecord::Base
	belongs_to :user 
	validates :creator_id, :user_id, :skill_id, presence: true
	validate :is_own_skill?

	def is_own_skill?
		if self.creator_id == self.user_id
			errors.add(:base, "Same user error")
		end
	end
end
