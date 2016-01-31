class Menu

attr_reader :menu_display


def initialise
  @menu = {beef_burger: 4.50, 
          chicken_burger: 4.50
          egg_fried_rice: 3.00
           popcorn_duck: 6.00
          katsu_curry: 8.00}
end

def menu_show
	menu_display = @menu.dup
end

def item_price (x)
  menu[x]
end

end

 
