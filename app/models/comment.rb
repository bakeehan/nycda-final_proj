class Comment < ApplicationRecord
	belongs_to :user
	belongs_to :achievement
	delegate :mentorship, :to => :achievement, :allow_nil => true
end
