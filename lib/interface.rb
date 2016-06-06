require_relative 'menu'
require_relative 'order'
require_relative 'send_message'
require_relative 'boolean_input'

class Interface
	include Boolean_input

	def initialize
		@menu = Menu.new
		run
	end
	def get_number(display_message)
		puts display_message
		gets.to_i
	end

	def still_ordering?
		choice = yn("Add something else to your order?" )
	end

	def select_order
		puts @menu.view
		@ordering = true
		@orderArray = []
		while @ordering
			dish = get_number("Please enter a dish:")
			quantity = get_number("Please enter how many:")
			@orderArray << [dish, quantity]
			@ordering = still_ordering?
		end
	end

	def run
		puts "⌒°(ᴖ◡ᴖ)°⌒  Takeaway ⌒°(ᴖ◡ᴖ)°⌒"
		select_order
		order = Order.new(menu, @orderArray)
		if order.confirm_order
			abort("Thank you, your order is on the way!")
		else
			run if yn("Start again?")
			abort("Thank you, bye!")
		end
	end
end