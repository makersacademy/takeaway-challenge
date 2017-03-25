# Takeaway receives menus and displays their lists with dishes
require_relative 'menu'

class Takeaway

	attr_reader

	def initialize

	end

	def view(menu)
		@menu = menu
	end
end