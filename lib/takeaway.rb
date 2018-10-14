class Takeaway

  def initialize(menu = Menu.new, format = FormatMenu.new, order = Order.new, price = Price.new)
    @menu = menu
    @format = format
    @order = order
    @price = price
  end

  def show_menu
    @format.format_menu(@menu.items)
  end

  def add_to_order(dish, quantity)
    @order.add_to_order(dish, quantity)
  end

end
