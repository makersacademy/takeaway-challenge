class Takeaway

  def initialize(menu = Menu.new, format = FormatMenu.new,
    order = Order.new, price = Price.new, contact = CustomerContact.new)
    @menu = menu
    @format = format
    @order = order
    @price = price
    @contact = contact
  end

  def show_menu
    @format.format_menu(@menu.items)
  end

  def add_to_order(dish, quantity)
    @order.add_to_order(dish, quantity)
  end

  def print_order
    @order.format_order
  end

  def finish_order
    total = @price.total(@order.order)
    @contact.send_message(total)
  end

end
