class Menu

	def initialize
		@menu = {fish_and_chips: 5.99, curry_and_rice: 7.99, wun_ton_soup: 5.99, sweet_and_sour_pork: 6.50, prawns_chop_suey: 5.50}
	end

	def show
		@menu.each { |meal,price| print "#{meal}		£#{price}\n"}
	end
end