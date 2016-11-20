require_relative "order"

class Menu

  attr_reader :menu

  def initialize
    @menu = menu_items
  end

  def menu_items
    [
    [1, "Margerita pizza       ", 5.50],
    [2, "Pepperoni pizza       ", 6.50],
    [3, "Quatro Staggioni Pizza", 6.50],
    [4, "Donner Kebab          ", 3.50],
    [5, "Cheeseburger          ", 5.00]
  ]
  end

end
