class Establishment

	def initialize(menu)
		@menu = menu
	end

	def view_menu
		@menu.list
	end

end