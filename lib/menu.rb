class Menu


def initialize
	@menu = Hash.new
	@menu = {:beef_burger => 4.5,
					 :chicken_burger => 4.5,
           :egg_fried_rice => 3,
           :popcorn_duck => 6.00,
           :katsu_curry => 8.00}

end

def show_menu
 menu_display = @menu.dup
 menu_display

end

def item_price (x)
  menu[x]
end

end

