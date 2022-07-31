class Menu
  
  def initialize
    @menu = { "Grilled cheese" => 12, "Tomato soup" => 15, "Flatbread pizza" => 17,
            "Mini pizza" => 10, "Mini burger" => 7 }
  end
  
  def add_item(name, price)
    @menu[name] = price
    @menu
  end
  
  def remove_item(name)
    @menu.delete(name)
    @menu
  end
  
  def display_menu
    return "Nothing on the menu" if @menu.empty?
    @menu
  end
  
end
