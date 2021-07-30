class Menu
  
  attr_reader :menu

  def initialize
		@menu = { "big mac" => 2.30, 
	            "chicken mayo" => 1.10, 
					    "veggie wrap" => 2.10, 
					    "fries" => 0.70 }
	end

  def see_menu
	  print @menu
	end

end
