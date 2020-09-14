#it supposed to have a menu and supposed to be able to take an order
require "menu"
require "order"
require "sms"

class Restaurant
	attr_accessor :menu, :order, :sms
	
	def initialize(menu, order, sms = nil)
		@menu = menu
		@order = order
		@sms = sms 
	end 
	def show_menu
		@menu.print
	end

	def confirm_order(dishes)
		dishes.each do |dish, amount|
		order.add_order(dish, amount)
		end
		sms.send
		order.total 
	end 
end 
 