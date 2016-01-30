require "./lib/menu"

class Takeaway

	attr_reader 

	def initialize
	@menu = Menu.new
	@dishes = @menu.dishes
	end

	def list_menu
	@dishes
	end


end
