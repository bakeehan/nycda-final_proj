class Comment < ApplicationRecord
	belongs_to :user
	belongs_to :achievement
	delegate :activity, :to => :achievement, :allow_nil => true
	delegate :mentorship, :to => :achievement, :allow_nil => true
	delegate :bracket, :to => :mentorship, :allow_nil => true
	delegate :student, :to => :mentorship, :allow_nil => true
	delegate :teacher, :to => :mentorship, :allow_nil => true
end
