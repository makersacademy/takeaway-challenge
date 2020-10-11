class Takeaway
  attr_reader :menu

  def initialize(menu, order = Order.new(menu))
    @menu = menu
    @order = order
  end

  def add_to_cart(item, quantity)
    @order.add_to_cart(item, quantity)
  end

  def cart
    @order.cart
  end

  def checkout
    @order.checkout
  end
  

  def print_menu
    @menu.print
  end
end
