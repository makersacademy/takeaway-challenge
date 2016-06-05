require_relative 'menu'

class Takeaway

	def read_menu
		menu = Menu.new
		menu.display_menu
	end

end