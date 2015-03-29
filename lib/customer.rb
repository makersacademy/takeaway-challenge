require 'send_sms'

class Customer

	include Send_sms

	attr_reader :dish_list

	def initialize(dish_list = [])
		@dish_list = dish_list
	end

	def place_order(order)
		@order = order.dishes
	end

	def has_orders?
		@order
	end

	def confirm_order(order)
		@order = nil
		send_text
	end
end