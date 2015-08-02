class Order 

	attr_reader :menu, :order

	def initialize
		@order_list = {}
		@food = Menu.new.food
	end

	def show_menu
		@food
	end

	def select_dish(dish, number)
		fail "We don't serve that item, sorry!" unless item_on_menu?(dish)
		@order_list.store(dish, number)
	end

	def total_cost
		fail "You have not selected any items" if @order_list.empty?
		total = 0 
    @order_list.each do |dish, number| 
      total += number * @food[dish]
    end
    "Total cost of yout meal is £#{total}"
	end

	def show_order
		@order_list
	end

	def place_order
		send_confirmation_message
	end

private
	
	def item_on_menu?(dish)
		@food.has_key?(dish)
	end

end