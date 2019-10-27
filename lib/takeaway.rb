require_relative 'menu'

class Takeaway
  attr_reader :basket

  def initialize(menu_items = {})
    @menu = Menu.new(menu_items)
    @basket = {}
  end

  def view_menu
    @menu.print
  end

  def add_to_basket(item, quantity)
    raise 'Item not on menu' unless @menu.on_menu? item

    @basket[item] = quantity
  end

  def place_order
  end
end
