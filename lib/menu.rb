require_relative 'dish'

class Menu

	attr_reader :dishes

	def initialize
		@dishes = []
	end


	def add_dish(dish)
		@dishes << dish
	end

	def list_dishes
		@dishes.each do |d|
				puts "-----\n #{d.name}\n £#{d.price}"
		end
	end

end