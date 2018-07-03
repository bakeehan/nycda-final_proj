class Activity < ApplicationRecord
	belongs_to :bracket
	has_many :achievements
end
