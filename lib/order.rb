require './lib/menu.rb'

class Order
	attr_reader :basket

	def initialize(menu = Menu.new)
		@basket = []
		@menu = menu
	end

	def add(dish_number)
		@menu.dishes.each { |item| @basket << item if item[:dish_number] == dish_number }
	end
end
