#it supposed to have a menu and supposed to be able to take an order
require "menu"
require "order"
require "sms"

class Restaurant
	attr_accessor :menu, :order
	
	def initialize(menu, order)
		@menu = menu
		@order = order
	end 
	def show_menu
		@menu.print
	end

	def confirm_order(dishes)
		dishes.each do |dish, amount|
		order.add_order(dish, amount)
		end
		order.total 
	end 
end 
 