class Activity < ApplicationRecord
	belongs_to :bracket
	has_many :achievements
	serialize :build_array
end
