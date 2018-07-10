module AchievementsHelper

	def preview_mode(input, num)
		item = input.split(" ")
		if item.length > num
			out = []
			for i in 0..num
				out.push(item[i])
			end
			out.push("[...]")
			return out.join(" ")
		else
			return item.join(" ")
		end
	end

end
