class Takeaway
	attr_reader :menu, :order
	def initialize(menu:, order: nil)
		@menu = menu
		@order = order
	end
	def show_menu
		menu.show
	end
	def selector(dishes)
		dishes.each do |dish, quantity|
			order.add(dish, quantity)
		end
	end
end