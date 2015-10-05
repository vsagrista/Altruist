class Meeting < ActiveRecord::Base
	has_many :transactions
end
