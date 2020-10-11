class Takeaway
  attr_reader :menu

  def initialize(menu)
    @menu = menu
    @order = Order.new(menu)
  end

  def add_to_cart(item, quantity)
    @order.add_to_cart(item, quantity)
  end

  def cart
    @order.cart
  end

  def print_menu
    @menu.print
  end
end
