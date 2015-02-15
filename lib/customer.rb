require_relative './sms.rb'

class Takeaway

	include Sms

	attr_reader :menu_list

	def initialize(menu_list = [])
		@menu_list = menu_list
	end

	def add(menu_list)
		@menu_list << menu_list
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