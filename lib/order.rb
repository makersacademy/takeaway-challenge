require_relative 'menu'

class Order 

	attr_reader :food, :total, :phone_number

	def initialize(takeaway)
		@takeaway = takeaway
		@menu = @takeaway.menu.dishes
		@food = {}
		@total = 0
	end

	def select(dish_number)
		dish = @menu[dish_number]
		raise 'We do not have a dish with that number!' unless dish
		@food.keys.include?(dish) ? @food[dish] += 1 : @food[dish] = 1
	end

	def calculate_total
		@food.each { |dish, quantity| @total += quantity*dish.price }
	end

	def place(phone_number)
		@phone_number = phone_number
		@takeaway.place(self)		
	end
	
end
