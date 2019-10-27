require_relative 'menu'

class Takeaway
  def initialize(menu_items = {})
    @menu = Menu.new(menu_items)
  end

  def view_menu
    @menu.print
  end

  def place_order(items)
  end
end
