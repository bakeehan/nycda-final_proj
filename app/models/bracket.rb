class Bracket < ApplicationRecord
	serialize :level_system
	has_many :mentorships
	has_many :activities
	has_many :students, :through => :mentorships, source_type: "User"
	has_many :teachers, :through => :mentorships, source_type: "User"
	has_many :achievements, :through => :activities
	has_many :comments, :through => :achievements
end
