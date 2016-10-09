require_relative 'menu'

class Order 

	attr_reader :food, :total

	def initialize(menu)
		@menu = menu.dishes
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

	def place
		puts "Order Placed:"
		@food.each do |dish, quantity| 
			puts "#{quantity} - #{dish.name}"
		end
		puts "Order Total: £#{total}"
	end

	# def place
	# 	puts "Order placed:"
	
	#   puts "Order Total: #{order.total}"
	# 	send_text
	# end

	# def send_text
	# 	@client.messages.create(
	#   from: '+447572283141',
	#   to: '+447572283141',
	#   body: "Thank you! Your order was placed and will be delivered before 18:52")
	# end

end
