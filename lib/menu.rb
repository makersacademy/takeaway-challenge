class Menu

	def initialize
		@menu = {
				 	'garlic bread' => '£2.50',
				 	'pizza'		   => '£7.00'	
				}
	end

	def print_menu
		puts @menu.map{|k,v| "#{k}: #{v}"}.join(",\n")
	end

end