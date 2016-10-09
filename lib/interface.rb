require_relative 'order'
require_relative 'menu'
require_relative 'dish'
require 'twilio-ruby'
require 'envyable'
Envyable.load('./config/env.yml','development')

class Interface

	attr_reader :menu_class, :menu, :order_class	

	def initialize(menu_class = Menu, order_class = Order)
		@order_class = order_class
		@menu_class = menu_class
		@menu = @menu_class.new
		display_menu
	end

	def display_menu
		@menu.dishes.each_with_index { |dish,index| puts "#{index+1}. #{dish.name} #{dish.price}"}
	end

	def place_order
		order = new_order
		get_item_input(order)
		order.confirm_order
	end

	def new_order
		@order_class.new
	end

	def get_item_input(order)
		finished = false
		puts "please select dish by menu number and quantity(i.e 1 2). Type finished when order is complete"
		until finished
			selection = STDIN.gets.chomp
			selection == "finished" ? finished = true : add_items_to_order(order,selection)
		end 
	end

	def add_items_to_order(order,selection)
		selection = selection.split(" ").map(&:to_i)
		dish_number = selection[0] - 1
		quantity = selection[1]
		quantity.times {order.update_order(@menu.dishes[dish_number])}
	end
end

