require './lib/menu'

class Cart
	attr_reader :selection, :order_total
	
	def initialize
		@menu = Menu.new
		@selection = []
		@order_total = 0
	end
	
	def view_menu
		@menu.view
	end
	
	def select(*items)
		items.each do |item| 
			@selection << @menu.dish_list[item - 1][:name] 
			@order_total += @menu.dish_list[item - 1][:price]
		end 
	end
	
	def show_cart
		puts "Your order: #{@selection.join(', ')}. Total: £#{@order_total}"
	end
end
