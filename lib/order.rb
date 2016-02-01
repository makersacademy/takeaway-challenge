require './lib/menu.rb'

class Order

	attr_reader :basket


	def initialize (menu = Menu.new)
		@menu = menu
		@this_menu = {}
		@basket = []
		@confirmed_order = false
		@item_costs = []

	end

	def this_menu
		@this_menu = @menu.show_menu.dup
	end

	def add_to_basket(dish, quantity)
		this_menu
		raise 'Order already confirmed. Please submit new order' if confirmed_order?
		raise 'Item not on menu' if !@this_menu.include?(dish)
		quantity.times {@basket << dish}
		price_of_each_item
		@basket
	end


	def total
		total = 0
		@item_costs.each {|x| total += x }
		total
	end


	def receipt
		@item_costs.zip(@basket) << "TOTAL: £#{total}"
	end



	def confirm_order
		raise 'Order already confirmed. Please submit new order' if confirmed_order?
			@confirmed_order = true

			#send text message. New delivery!
	

	end




private

	def price_of_each_item
		
		@basket.each do |x|

	 		  @item_costs << @this_menu[x]
		
		end
	end

	def confirmed_order?
		!!@confirmed_order
	end


end
