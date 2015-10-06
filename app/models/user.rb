class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :skills
  has_many :transactions
  validates :name, :about, :email, :address, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable # :trackable, :validatable

  def find_skills_that_match_typed_address(location)
    locations = Skill.all.select do |skill|
       skill.address.split(",").collect{|x| x.strip}.map(&:downcase).include? location.downcase
    end
  end

  def self.find_skills_on_that_address_that_match_user_search(location_search,skill)
    skills = location_search.select {|location| location.name.downcase == skill.downcase}
  end

end
