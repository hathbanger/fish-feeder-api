class Fish < ApplicationRecord
	belongs_to :user
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
