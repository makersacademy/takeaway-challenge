require_relative 'menu'
require_relative 'dish'

class CustomerOrder 

	attr_reader :my_order, :current_menu, :selection

	def initialize(instance_menu)
		@instance_menu = instance_menu
		@current_menu = @instance_menu.menu_list	
		@my_order = Hash.new
	end

	def add_to_order(this_dish, amount)
		fail "#{this_dish} is not on the menu." if !@instance_menu.find(this_dish)
		@my_order[selected(this_dish)] = amount
	end

	def remove_from_order(this_dish, amount)
		fail "#{this_dish} is not in your order." if !find_in_order(this_dish)
		if amount < find_in_order(this_dish)
		@my_order[selected(this_dish)] = amount
		else
		@my_order.delete(find_in_order(this_dish)) #need to fix this
		end
	end

	private

	def find_in_order(this_dish)
		@my_order[selected(this_dish)] 
	end

	def selected(this_dish)
		selection = Hash.new
		selection[this_dish] = @current_menu[this_dish]
		selection
	end

end
