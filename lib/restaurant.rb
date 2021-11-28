
class Restaurant
	attr_reader :pizza_menu
	attr_reader :orders

	def initialize
		@pizza_menu = [
			{bianco: 4.99},
			{diavolo: 5.99},
			{funghi: 5.00},
			{pepperoni: 6.00},
			{vegetarian: 4.99},
			{calabria: 5.00},
			{roma: 6.25}, 
			{fumo: 5.80},
			{formaggi: 5.80}, 
			{regina: 6.80},
			{fiorentina: 5.80},
			{sicilian: 6.00}
		]

		@orders = []
	end

end