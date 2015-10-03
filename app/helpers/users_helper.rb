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
end
