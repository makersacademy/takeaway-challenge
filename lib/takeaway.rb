# deals with orders + cost
require 'order'

class Takeaway

	def initialize(menu:, order: nil) #dependency injection - 'other class is injected into this class to enable menu class methods to be accessed'
		@menu = menu
		@order = order || Order.new
	end

	def print_menu
		menu.print
	end

	def place_order(dishes)
		dishes.each do |dish, quantity|
		order.add(dish, quantity)
		end
	end

	private

	attr_reader :menu, :order  ## ?? ## why are these private?

end