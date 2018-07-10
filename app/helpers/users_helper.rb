module UsersHelper

	def g_comment_feed
		feed = []
		current_user.achievements.each do |submission|
			submission.comments.each do |comment|
				feed.push(comment)
			end
		end
		# current_user.mentorships.where("is_complete" => false).each do |mentorship|
		# 	mentorship.bracket.activities.each do |activity|
		# 		if !activity.achievements.where("user" => current_user)[0]
		# 			feed.push(activity)
		# 		end
		# 	end
		# end
		out = cut_feed(feed)
		return out
	end

	def g_activity_feed
		feed =[]
		current_user.mentorships.where("is_complete" => false).each do |mentorship|
			mentorship.activities.each do |activity|
				if check_activity(activity, current_user) == false
					feed.push(activity)
				end
			end
		end
		return feed
	end

	def g_student_feed
		feed =[]
		Mentorship.where("teacher" => current_user).each do |mentorship|
			mentorship.student.achievements.each do |submission|
				feed.push(submission)
			end
		end
		out = cut_feed(feed)
		return out
	end

	def g_mentorship_feed(ment)
		feed = []
		ment.achievements.each do |submission|
			feed.push(submission)
			submission.comments.each do |comment|
				feed.push(comment)
			end
		end
		ordered = (feed.sort_by &:updated_at).reverse
		return ordered
	end

	def cut_feed(feed)
		ordered = (feed.sort_by &:created_at).reverse
		cut = []
		if ordered.length > 4
			for i in 0..3 do
				cut.push(ordered[i])
			end
		else
			cut = ordered
		end
		return cut
	end

end
