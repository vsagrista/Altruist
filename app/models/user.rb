class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :name, :about, :email, :password, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable # :trackable, :validatable
end
