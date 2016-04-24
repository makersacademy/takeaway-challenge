class Takeaway

	def initialize(menu:Menu.new, order:Order.new)
		@menu = menu
		@order = order
	end
	def display_menu#this will use the command from the menu class to show the menu
		menu.display
	end
	def order_dishes(number_dishes)#number_dishes = {jajangmyun: 1, bibimbap: 2}
		order.log(number_dishes) #this way order class will calculate the prices
		order.total
	end

	private

	attr_reader :menu, :order #don't want to show the class
end