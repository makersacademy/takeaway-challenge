require_relative 'dish'

class Menu
private
	attr_reader :list, :basket
public
	def initialize
		@list = []
		@basket = []
	end

	def add dish
		list << dish
		puts "#{dish.name} was added to the menu."
	end

	def order dish, quantity=1
		quantity.times { basket << dish }
		puts "You added #{dish.name} x#{quantity} to your basket."
	end

	def read_menu
		list
	end

	def basket_summary
		basket
	end

end