class Menu

  attr_reader :food_menu

  FOOD_MENU = [{ dish: "Burger", price: 5 }, { dish: "Pizza", price: 7 }]

  def initialize(food = FOOD_MENU)
    @food_menu = food
  end

  def show_menu
    food_menu.map { |hash|
      "#{hash[:dish]} - £#{hash[:price]}" 
    }.join(", ")
  end
end
