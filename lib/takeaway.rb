class TakeAway
  def initialize(menu = Menu.new, order = Order.new(menu))
    @menu = menu
    @order = order
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
    "£#{@order.total}"
  end

  def checkout(amount)
    raise('Incorrect amount. You need to enter the correct order total to checkout.') unless correct_amount?(amount)
  end

  private

  def correct_amount?(amount)
    amount == @order.total
  end

end
