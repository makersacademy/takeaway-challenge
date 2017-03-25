# Takeaway receives menus and displays their lists with dishes
require_relative 'menu'

class Takeaway

	attr_reader :import_menu, :view_menu

	def initialize
    @import_menu
    @view_menu
	end

	def import_raw_menu
		@import_menu = Menu.new
		menu = self.import_menu.dishes
	end

	def view_menu
		import_raw_menu
	end
end