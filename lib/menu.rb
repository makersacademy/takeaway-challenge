
class Menu
  MENU = [
    { dish: "Burger", price: 12 },
    { dish: "Veggie Burger", price: 14 },
    { dish: "Chicken Burger", price: 16 },
    { dish: "Cheese Burger", price: 12 },
  ]
  def initialize(dishes = MENU)
    @dishes = dishes
  end

  def show_menu
    @dishes
  end
end
