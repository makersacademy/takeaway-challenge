class Takeaway
  attr_reader :menu, :order

  def initialize(menu = Menu.new, order = Order.new)
    @menu = menu
    @order = order
  end

  def show_menu
    @menu.open
  end

  def add_to_order(item, qty = 1)
    @order.add_cart(item, qty)
  end

  def order_total
    @order.cart_total(menu)
  end
end
