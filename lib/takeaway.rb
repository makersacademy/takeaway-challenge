class TakeAway
  def initialize(menu = Menu.new)
    @menu = menu
    @order = Order.new
  end

  def show_menu
    @menu.menu_items
  end

  def add_to_order(item, quantity = 1)
    @order.add_items(item, quantity)
  end
end
