class Transaction < ActiveRecord::Base
	belongs_to :user 
	validates :creator_id, :user_id, :skill_id, presence: true
end
