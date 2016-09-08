class Fish < ApplicationRecord
	def add_food
		if self.food == nil
			self.food = 1
		else
			self.food += 1
		end
		self.save
		return self.food
	end
end
