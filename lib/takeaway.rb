require_relative "order"
require_relative "menu"

class Takeaway

attr_reader :menu

  def initialize
    @menu
  end

  def add_menu_items(menu)
    @menu = menu.add_menu_items
  end

  def menu_item(number)
  @menu[number-1]
  end

end
