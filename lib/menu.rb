class Menu

	attr_reader :menu

	def initialize
		@menu = {
			soup: 4.5,
			fried_rice: 7.0,
			chicken: 6.0,
			turkey: 6.0,
			beef: 7.0,
			salmon: 7.5,
			soft_drink: 2.0,
			beer: 3.0
		}	
	end

	def show_menu
		@menu.each {|key,value| puts "#{key}: £ #{value}"}
	end

	def on_menu?(dish)
		@menu.key?(dish.to_sym)
	end

end
