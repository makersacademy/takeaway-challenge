#it supposed to have a menu and supposed to be able to take an order
require "menu"
require "order"

class Restaurant
	attr_accessor :menu

	def initialize(menu)
	@menu = menu
	@order = nil
	@sms = nil
	end 
end 