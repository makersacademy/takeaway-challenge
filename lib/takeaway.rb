# Takeaway receives menus and displays their lists with dishes
require_relative 'menu'

class Takeaway

	attr_reader :import_menu, :view_menu, :orders, :basket, :dish, :amount, :price

	def initialize
    @import_menu = Menu.new
    @view_menu
    @orders = []
    @dish
    @amount
	end

	def view_menu
		menu = self.import_menu.dishes
	end

	def place_order(dish, amount)
		if view_menu.key?[dish]
		  puts "#{amount}x #{dish} added to basket" 
		  @dish = dish
		  @amount = amount
		  @price = view_menu[dish]
		  self.add_to_orders(dish, price, amount)
		end
	end

	def add_to_orders(dish, price, amount)
		@orders << {dish_name: dish, price: price , amount: amount }
	end
  
end