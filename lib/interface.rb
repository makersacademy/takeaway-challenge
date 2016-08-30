# This sort of runs the whole program, by prompting the user
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
	def get_number(display_message, limit=false)
		puts display_message
		num = gets.to_i
		if limit
			if num > 0 && num < 13
				return num
			else
				puts "Choices are between 1 and 12"
				get_number(display_message, limit)
			end
		elsif num > 0
			return num
		else
			puts "Choice must be more than 1"
			get_number(display_message, limit)
		end
	end

	def still_ordering?
		choice = yn("Add something else to your order?" )
	end

	def select_order
		puts @menu.view
		@ordering = true
		@orderArray = []
		while @ordering
			dish = get_number("Please enter a dish:", true)
			quantity = get_number("Please enter how many:")
			@orderArray << [dish, quantity]
			@ordering = still_ordering?
		end
	end

	def run
		puts "⌒°(ᴖ◡ᴖ)°⌒  Takeaway ⌒°(ᴖ◡ᴖ)°⌒"
		select_order
		order = Order.new(@menu, @orderArray)
		if order.confirm_order
			abort("Thank you, your order is on the way!")
		else
			run if yn("Start again?")
			abort("Thank you, bye!")
		end
	end
end