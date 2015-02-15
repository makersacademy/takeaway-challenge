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
		raise 'The total amount is incorrect' if order_incorrect == true
		list_menu = menus.join(',').scan(/\d+/).collect{|i| i.to_i}
		sum_menu = list_menu.inject{ |sum, n| sum + n}
	end


	def total
		menus.inject(Hash.new(0)){|total, s| total[s] +=1 ;total}
	end

	def time
		now = Time.now + (60*60)
		future = now.strftime("%H:%M")
	end


	def order_incorrect
		@order_incorrect
	end


	def order_complete
		@order_complete
	end



end