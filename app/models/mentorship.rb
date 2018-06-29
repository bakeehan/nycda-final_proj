class Mentorship < ApplicationRecord
	belongs_to :teacher, polymorphic: true
	belongs_to :student, polymorphic: true
	belongs_to :tree
	has_many :achievements
	has_many :comments, :through => :achievements
end
