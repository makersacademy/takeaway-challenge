class Order 

	attr_reader :menu, :order_list
	attr_accessor :restaurant

	def initialize
		@order_list = {}
		@food = Menu.new.food 	# need to remove dependencies
		@restaurant = Restaurant.new   # need to remove dependencies
	end

	def show_menu
		@food
	end

	def select_dish(dish, number)
		fail "We don't serve that item, sorry!" unless item_on_menu?(dish)
		@order_list.store(dish, number)
	end

	def print_receipt
		fail "You have not selected any items" if nothing_ordered?
		total = 0 
    @order_list.each do |dish, number| 
      total += number * @food[dish]
    end
    "Total cost of your meal is £#{'%.2f' % total}"
	end

	def show_order
		@order_list
	end

	def place_order
		fail "You have not selected any items" if nothing_ordered?
		@restaurant.send_confirmation_message
		"Thank you for your order! It will arrive at #{(Time.now + 3600).hour}:#{Time.new.min}"
	end

private
	
	def item_on_menu?(dish)
		@food.has_key?(dish)
	end

	def nothing_ordered?
		@order_list.empty?
	end

end