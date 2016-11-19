require_relative "order"

class Menu

attr_reader :menu_items, :current_menu

  def initialize
    @menu_items
    add_menu_items
  end

  def add_menu_items
    @menu_items =
    [
    [1, "Margerita pizza", 5.50],
    [2, "Pepperoni pizza", 6.50],
    [3, "Quatro Staggioni Pizza", 6.50],
    [4, "Donner Kebab", 3.50],
    [5, "Cheeseburger", 5.00]
  ]
  end

  def menu_item(number)
  @menu_items[number-1]
  end

end
