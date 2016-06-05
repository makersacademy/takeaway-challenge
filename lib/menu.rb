#it understands the showing of items on a menu

class Menu

	attr_reader :food_list

	def initialize
		@food_list = {}
	end

	def add_to_menu(item,price)
		@food_list[item] = price
	end

	def show_menu
		@food_list.each do |k,v|
			p "#{k.to_s.capitalize} is £#{sprintf('%.2f', v)}" 
		end
	end

end