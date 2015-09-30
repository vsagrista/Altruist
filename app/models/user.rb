class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :skills
  validates :name, :about, :email, :password, :address, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable # :trackable, :validatable
end
