class Menu

	attr_accessor :menu_list, :menu_keys, :menu_values

	def initialize
		@menu_list = menu_list
		@menu_keys = menu_list.keys
		@menu_values = menu_list.values
	end

		def menu_list
			menu_list = {Burger: 6,
							FishandChips: 7,
							PieandMash: 9,
							Pizza: 8,
							Beer: 4,
							Wine: 5,
							Juice: 2}
		end

		def show
			puts "MENU"
			count = 1
			menu_list.each do |key, value|
				puts "#{count}:#{key} - £#{value}"
				count += 1
			end
		end
end