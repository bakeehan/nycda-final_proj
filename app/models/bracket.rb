class Bracket < ApplicationRecord
	has_many :mentorships
	has_many :activities
	has_many :users, :through => :mentorships
	has_many :achievements, :through => :activities
end
