require_relative 'order'

class Menu

attr_reader :selection
attr_reader :price
attr_reader :selection

def initialize
  @selection = Order.new
end

  MAIN_MENU = {
      "Chicken Katsu Curry" => 10,
      "Tofu Katsu Curry" => 8,
      "Prawn Tempura" => 5,
      "Vegetable Tempura" => 5,
      "Yakisoba" => 7,
      "Miso Soup" => 2
    }

  def view_menu
    MAIN_MENU
  end

  def place_order(dish, quantity)
    @selection = MAIN_MENU[dish]
    @amount = @selection * quantity
    add_order
  end

end
