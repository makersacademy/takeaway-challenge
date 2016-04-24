class Takeaway

	def initialize(menu:Menu.new, order:Order.new)
		@menu = menu
		@order = order
	end
	def display_menu
		menu.display
	end
<<<<<<< HEAD
	def order_dishes(number_dishes)
		order.log(number_dishes) 
=======
	def order_dishes(number_dishes)#number_dishes = {jajangmyun: 1, bibimbap: 2}
		order.log(number_dishes) #this way order class will calculate the prices
>>>>>>> e0a906505dc8788842b91dffc12af2fdc6daa78b
		order.total
	end

	private

	attr_reader :menu, :order 
end