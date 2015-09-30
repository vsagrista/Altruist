class Transaction < ActiveRecord::Base
	belongs_to :user 
	#validates :name, :about, :email, :password, :address, presence: true
end
