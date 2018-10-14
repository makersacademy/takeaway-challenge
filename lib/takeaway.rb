class TakeAway
  def initialize(menu: Menu.new,
    order: Order.new(menu),
    messenger: Messenger.new)

    @menu = menu
    @order = order
    @messenger = messenger
  end

  def show_menu
    @menu.menu_items
  end

  def add_to_order(item, quantity = 1)
    @order.add_items(item, quantity)
  end

  def order_summary
    @order.order_summary
  end

  def total
    @order.total
  end

  def checkout(amount)
    @order.checkout(amount)
    @messenger.send_text
  end

end
