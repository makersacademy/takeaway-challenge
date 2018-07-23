class Menu

	attr_reader :items

	def initialize
		@items = {
				"thing1" => 4.50,
				"thing2" => 7.75
				}
	end

	def view_menu
		@items.map{|k,v| "#{k}: £#{v.round(2)}"}.join(",\n")
	end

end
