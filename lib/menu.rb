class Menu
	attr_reader :show_menu, :dishes

	MENU = { "spring roll" => 0.99, 
 		"char sui bun" => 3.99,
 		"rex steak" => 2.99, 
 		"dodo egg" => 7.99, 
 		"fu-king fried rice" => 5.99
 	}
	
	def initialize(dishes = MENU)
 		 @dishes = dishes
 	end

	def read_menu
 	  @dishes.each { |a, b| puts "#{a.capitalize} - £#{b}" }
 	end
end
