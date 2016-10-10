require 'csv'

class Menu

	attr_reader :item_list

	def initialize
		@item_list = []
	end

	def add_items(item, description, price)
	 	@item_list << {item: item, description: description, price: price}
	end

 	def upload
		CSV.open("./lib/maki_list.csv").read.each do |csv|
			add_items(csv[0], csv[1], csv[2])
		end
		@item_list
	end


end