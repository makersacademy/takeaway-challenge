class Menu

  def menu_items
    { "Spaghetti Bolognese": 6.5, 
      "Veggie Burger": 7.5,
      "Stir Fried Rice": 5.0,
      "Cherry Tomato Soup": 4.8,
      "Pad Thai Noodles": 7.0,
      "Grilled Chicken Salad": 7.5,
      "Vanilla Ice Cream": 3.0,
      "Fudge Chocolate Cake": 3.5,
      "Classic Mojito": 4.5,
      "Lemonade": 2.0,
      "Apple Juice": 2.0 } 
  end

  def view_menu
    @menu = []
    num = 0
    menu_items.each do |k,v| 
      @menu << "#{num+=1}. #{k} £#{v}0"
    end
     puts @menu
  end

end
