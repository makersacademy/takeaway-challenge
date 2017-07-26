
require_relative 'order.rb'
require_relative 'sms_confirmation'

class CustomerView

	def	initialize
		@order = nil
		greeting
	end

	def greeting
		"Welcome to Sam's takeaway."
		print_menus
	end

	private

	def print_menus
		num_menus = Menu.print_menus
		puts "Which menu number would you like to order from?"
		choose_menu(num_menus)
	end

	def choose_menu(num_menus)
		menu_num = gets.chomp.to_i
		check_valid_menu(menu_num, num_menus)
		create_order(menu_num)
	end

	def check_valid_menu(menu_num, num_menus)
		unless (menu_num <= num_menus)
 			puts "Not a valid menu number"
 			print_menus
 		end
 	end

	def create_order(menu_num)
		@order = Order.new
		@order.get_menu(menu_num)
		order_dish
	end

	def order_dish
		dish = select_dish
		quantity = select_quantity
		@order.get_dish(dish, quantity.to_i)
		dish_confirmation(dish.capitalize, quantity)
	end

	def select_dish
		puts "Please enter the name and the dish you would like to order: "
		gets.chomp
	end

	def select_quantity
		puts "How many of this dish would you like?"
		gets.chomp.to_i
	end

	def dish_confirmation(dish, quantity)
		puts "You've added #{quantity} #{dish}"
		continue_order
	end

	def continue_order
		puts "Would you like to order something else? (y/n)"
		continue = gets.chomp.downcase
		continue == ("y" || "yes") ? order_dish : confirm_order
	end

	def confirm_order
		puts "Would you like to review your order? (y/n)"
		check = gets.chomp.downcase
		check == ("y" || "yes") ? check_order : check_total
	end

	def check_order
		@order.print_orders
		check_total
	end

	def check_total
		puts "The total bill comes to £#{@order.calculate_total}"
		payment
	end

	def payment
		puts "Please type p to pay now:"
		if gets.chomp.downcase == "p"
			puts "Thank you for your payment. A confirmation text will arrive shortly."
			sms_confirmation
		else
			check_order
		end
	end

	def sms_confirmation
		SmsConfirmation.new.send
	end
end
