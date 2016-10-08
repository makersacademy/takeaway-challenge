require_relative 'dish'

class Menu

	attr_reader :dishes

	def initialize
		@dishes = {}
	end

	def add(dish)
		@dishes[dish.number] = dish
	end

	def list
		@dishes.each do |number, dish|
				puts "-----\n #{number}.#{dish.name}\n £#{dish.price}"
		end
	end

end