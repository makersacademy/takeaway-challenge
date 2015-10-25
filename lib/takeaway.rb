require_relative 'menu'
require_relative 'confirmation'
require_relative 'text'


class Takeaway

	attr_reader :menu, :checkout

	def initialize(menu)
		@menu = menu
		@checkout = {}
	end
	
	def show
		menu.each { |meal,price| print "#{meal}		 £#{price}\n"}
	end

	def place_order(dish, qty)
		 @checkout[dish] = [menu[dish],qty] 
	end

	def confirm(user_total, confirmation = Confirmation.new(checkout))
		confirmation.user_cost(user_total)
	end

	def proceed(text = Text.new)
		text.message
	end
end

