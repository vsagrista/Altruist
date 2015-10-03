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
end
