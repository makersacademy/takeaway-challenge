require_relative 'dish'

class Menu

attr_reader :list

	def initialize
		@list = Array.new
	end

	def add_dish(dish)
		@list << dish
	end

	def delete_dish(dish)
		@list.delete(dish)
	end

end