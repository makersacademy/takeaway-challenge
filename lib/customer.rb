require_relative 'menu'

class Customer

	attr_accessor :customer_order

	def initialize
		@customer_order = []
	end


 	def place_order (choice)
 		menu = Menu.new
 		menu.view_menu.select do |key,value|
			if key == choice
				customer_order.push key => value
			end
		end
	end

	# def request_bill
	# 	customer_order.inject
end

