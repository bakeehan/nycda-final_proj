class Mentorship < ApplicationRecord
	belongs_to :teacher, polymorphic: true
	belongs_to :student, polymorphic: true
	belongs_to :bracket
	has_many :achievements
	has_many :comments, :through => :achievements
	has_many :activities, :through => :bracket
end
