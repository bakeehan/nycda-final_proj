class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # has_many :mentorships, as: :teacher
  has_many :mentorships, as: :student
  has_many :brackets, :through => :mentorships
  has_many :achievements
  has_many :comments
  # has_many :students, :through => :mentorships, source_type: "User"
  has_many :teachers, :through => :mentorships, source_type: "User"

end