require './lib/menu'

class Cart
	attr_reader :selection
	
	def initialize
		@menu = Menu.new
		@selection = []
	end
	
	def view_menu
		@menu.view
	end
	
	def select(*items)
		items.each { |item| @selection << @menu.dish_list[item - 1] } 
	end
end
