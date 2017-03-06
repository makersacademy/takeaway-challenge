class Menu

	attr_reader :items

	def initialize
		@items = {
				"garlic bread" => 2.99,
				"pizza" => 7.99
				}
	end

	def print_menu
		@items.map{|k,v| "#{k} : £#{v.round(2)}"}.join(",\n")
	end

end