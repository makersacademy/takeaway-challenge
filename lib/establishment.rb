class Establishment

	def initialize(menu,checker=Checker.new)
		@menu = menu
		@checker = checker
	end

	def view_menu
		@menu.list
	end

	def place_order(total,order)
		@checker.pass?(total,order,view_menu)
	end

end