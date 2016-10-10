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

	def check
		calculate_total
		puts "Here's your order so far:"
		@food.each do |dish, quantity| 
			puts "#{quantity} - #{dish.name}"
		end
		puts "Order Total: £#{total}"
	end

	def place(phone_number)
		calculate_total 
		@phone_number = phone_number
		@takeaway.place(self)		
	end
	
	private

	def calculate_total
		@food.each { |dish, quantity| @total += quantity*dish.price } unless @total !=0
		@total
	end
end
