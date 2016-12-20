require_relative 'menu'

class Order

	include Menu

	attr_reader :basket

	def initialize
		@basket = []
	end

	def add(number, quantity)
		index = number - 1
		quantity.times { @basket << Menu::MENU[index] }
	end

	def order_total
		total = 0.00
		@basket.each { | item |
			cost = item[:cost].sub(/£/, '').to_f
			total += cost
		}
		total
	end

end