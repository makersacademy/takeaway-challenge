require_relative 'menu'

class Takeaway

	def initialize(menu = Menu.new)
		@menu = menu
	end

	def read_menu
		@menu.display_menu
	end

end