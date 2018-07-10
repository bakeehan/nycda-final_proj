module AchievementsHelper

	def preview_mode(input)
		item = input.split(" ")
		if item.length > 30
			out = []
			for i in 0..30
				out.push(item[i])
			end
			out.push("[...]")
			return out.join(" ")
		else
			return item.join(" ")
		end
	end

end
