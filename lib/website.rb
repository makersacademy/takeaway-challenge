class Website

	attr_accessor :menu

	def initialize
		@menu = menu
		
	end
	

	def menus
		@menu ||= []
	end


	def add_order(menu)
		menus << menu
	end
	

	def menu_count
		menus.count
	end


	def sum
		list_menu = menus.join(',').scan(/\d+/).collect{|i| i.to_i}
		sum_menu = list_menu.inject{ |sum, n| sum + n}
	end






end