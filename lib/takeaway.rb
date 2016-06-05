require_relative 'menu'
require_relative 'order'
require_relative 'sms'

class Takeaway

	def initialize(menu = JapaneseMenu.new, order = Order.new(menu), contact_method_class = SMS)
		@menu = menu
		@order = order
		@contact_method_class = contact_method_class
	end

	def view_menu
		@menu.view
	end

	def add_to_order(item, quantity = 1)
		@order.add(item, quantity)
	end

	def view_order
		@order.view
	end

	def checkout
		p "Your total is £#{@order.total}. Please use '#confirm_order('£#{@order.total}')' to confirm your order."
	end

	def confirm_order(total)
		raise 'Incorrect amount! Please try again.' unless total == "£#{@order.total}"
		message = "Thank you! Your order was placed and will be delivered before #{(Time.new + 3600).strftime("%H:%M")}."
		@contact_method_class.new.send(message)
	end

end