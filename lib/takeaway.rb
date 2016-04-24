class Takeaway
  attr_reader :menu

  def initialize(menu = Menu.new, order = Order.new)
    @menu = menu
    @order = order
  end

  def read_menu
    @menu.read
  end

  def order(item, qty = 1)
    @order.select(item, qty)
  end

  def basket
    @order.basket
  end

  def summary
    @order.summary
  end

  def qty_tracker
    @order.qty_tracker
  end

end
