module TeacherHelper

	def make_recents(list)
		out = []
    	require 'date'
    	now = DateTime.now
    	list.each do |entry|
	    	if (entry.created_at != entry.updated_at)
	    		if (now.to_datetime - (entry.created_at.localtime.to_datetime)).to_i < 36
					out.push(entry)
				end
	    	else
	    		if (now.to_datetime - (entry.updated_at.localtime.to_datetime)).to_i < 36
					out.push(entry)
				end
			end
		end
		return out
	end

end
