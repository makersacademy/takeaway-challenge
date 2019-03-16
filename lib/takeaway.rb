class Takeaway

  def initialize(menu = Menu.new, order_class = Order)
    @menu = menu
    @order = order_class
  end

  def view_menu
    @menu
  end

  def place_order(order_hash, total)
    @order.new.create_order(order_hash, total)
  end
end
