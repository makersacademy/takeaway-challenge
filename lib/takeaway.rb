class Takeaway

	def initialize(menu:Menu.new, order:Order.new)
		@menu = menu
		@order = order
	end
	def display_menu
		menu.display
	end

	def order_dishes(number_dishes)
		order.log(number_dishes) 
		order.total
	end

	private

	attr_reader :menu, :order 
	
end