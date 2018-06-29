class Achievement < ApplicationRecord
	belongs_to :activity
	belongs_to :user
	belongs_to :mentorship
	has_many :comments
	delegate :bracket, :to => :activity, :allow_nil => true
end