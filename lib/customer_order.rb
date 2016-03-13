require_relative 'menu'
require_relative 'customer'


class CustomerOrder 

	attr_reader :my_order, :current_menu, :customer

	def initialize(instance_menu, name, number)
		@customer = Customer.new(name,number)
		@instance_menu = instance_menu
		@current_menu = @instance_menu.menu_list	
		@my_order = Hash.new
	end

	def add_to_order(this_dish, quantity)
		fail "#{this_dish} is not on the menu." if !@instance_menu.find(this_dish)
		if find_quantity(this_dish)
		 	@my_order[selected(this_dish)] = find_quantity(this_dish) + quantity
		else
			@my_order[selected(this_dish)] = quantity
		end
	end

	def remove_from_order(this_dish, quantity)
		fail "#{this_dish} is not in your order." if !find_quantity(this_dish)
		quantity < find_quantity(this_dish) ? @my_order[selected(this_dish)] = find_quantity(this_dish) - quantity : @my_order.delete(selected(this_dish))
	end

	private

	def find_quantity(this_dish)
		@my_order[selected(this_dish)] 
	end

	def selected(this_dish)
		@current_menu.select {|k,v| k == this_dish }
	end

	# def find_item(this_dish)
	# 	@my_order.select{ |k,v| k[this_dish]}
	# end



end
