
require 'menu'
require 'order'

class View

	def	initialize
		#@menu = nil
		@order = nil
		greeting
	end

	def greeting
		"Welcome to Sam's takeaway."
		list_menus
	end

	private

	def list_menus
		number_menus = Menu.list_menus
		puts "Which menu number would you like to order from?"
		choose_menu(number_menus)
	end

	def choose_menu(num_menus)
		menu_num = gets.chomp
		check_valid_menu(menu_num, num_menus)
		create_order
	end

	def check_valid_menu(menu_num, num_menus)
		unless (menu_num <= num_menus) && (num.is_a? Integer)
 			puts "Not a valid menu number" 
 			list_menus
 		end
 	end

	def create_order
		@order = Order.new
		@order.select_menu(menu_num)
		order_dish
	end

	def order_dish
		dish = select_dish
		quantity = select_quantity
		@order.select_dish(dish, quantity)
		dish_confirmation(dish.capitalize, quantity)
	end

	def select_dish
		puts "Please enter the name and the dish you would like to order: "
		gets.chomp
	end

	def select_quantity
		puts "How many of this dish would you like?"
		gets.chomp
	end

	def dish_confirmation(dish, quantity)
		puts "You've added #{quantity} #{dish}"
	end

	def continue_order
		puts "Would you like to order something else? (y/n)"
		continue? = gets.chomp.downcase
		continue? == y || yes ? order_dish : confirm_order
	end

	def confirm_order
		puts "Would you like to review your order? (y/n)"
		check? = gets.chomp
		check? == y || yes ? check_order; check_total : check_total
	end

	def check_order
		@order.list_orders
	end

	def check_total
		puts "The total bill comes to £#{@order.raise_total}"
	end

end

customer = View.new
