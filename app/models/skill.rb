class Skill < ActiveRecord::Base
	  belongs_to :user
	  validates :name, :description, presence: true
end
