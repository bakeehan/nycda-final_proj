module ApplicationHelper

	def check_activity(activity, user)
		if user.mentorships.where("bracket" => activity.bracket)
			user.achievements.each do |submission|
				if submission.activity == activity
					return true
				else
					return false
				end
			end
		else
			return nil
		end
	end

	def time_fixer(entry)
    	require 'date'
    	now = DateTime.now
		dated = entry.created_at.localtime.strftime("%B %-d")
		if ((entry.created_at != entry.updated_at) && (((now.to_datetime - entry.updated_at.localtime.to_datetime) * 24).to_i < 24) && (@now.strftime("%D") === entry.updated_at.localtime.strftime("%D")))
			dated = entry.updated_at.localtime.strftime("%l:%M%P")
		elsif entry.created_at != entry.updated_at && ((@now.to_datetime - entry.updated_at.localtime.to_datetime) * 24).to_i < 36
			dated = entry.updated_at.localtime.strftime("%B %-d, %l:%M%P")
		elsif entry.created_at != entry.updated_at
			dated = entry.updated_at.localtime.strftime("%B %-d")
		elsif (((now.to_datetime - entry.created_at.localtime.to_datetime) * 24).to_i < 24) && (@now.strftime("%D") === entry.created_at.localtime.strftime("%D"))
			dated = entry.created_at.localtime.strftime("%l:%M%P")
		elsif ((@now.to_datetime - entry.created_at.localtime.to_datetime) * 24).to_i < 36
			dated = entry.created_at.localtime.strftime("%B %-d, %l:%M%P")
		end
		return dated
	end

end
