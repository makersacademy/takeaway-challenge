require_relative 'menu'
require_relative 'dish'

class CustomerOrder 

	attr_reader :my_order, :instance_menu

	def initialize(instance_menu)
		@instance_menu = instance_menu
		@my_order = Array.new
	end

	def add_to_order(this_dish, amount)
		fail "#{this_dish} is not on the menu." if @instance_menu.find_on(@instance_menu.menu_list, this_dish).empty? 
		amount.times { @my_order << @instance_menu.find_on(@instance_menu.menu_list, this_dish) }
	end

	def remove_from_order(this_dish, amount)
		fail "#{this_dish} is not in your order." if @instance_menu.find_on(@my_order, this_dish).empty?
		amount.times { @my_order.delete( @instance_menu.find_on(@my_order, this_dish)) }
	end

	# private



	


end
