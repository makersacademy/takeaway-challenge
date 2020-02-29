require_relative 'menu'

class Order

  attr_reader :dishes

  def initialize(menu = Menu.new)
    @menu = menu
    @dishes = []
  end

  def view_menu
    @menu.view
  end

  def add(dish, quantity)
    fail "Quantity not provided. Please try again." unless quantity.is_a?(Integer)

    fail "Dish not available. Please try again." unless Menu::ITEMS.has_key?(dish)

    @dishes << { dish: dish, quantity: quantity }
  end

end
