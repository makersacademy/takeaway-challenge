class Website

	attr_accessor :menu, :quantity

	def initialize
		@menu = menu
		@menus = 0
		@quantity = 10
	end
	

	def menus
		@menu ||=[]
	end


	def add_order(menu)
		menus << menu
	end
	

	def menu_count
		menus.count
	end









end