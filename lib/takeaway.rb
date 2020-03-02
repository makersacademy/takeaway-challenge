class Takeaway

  attr_reader :current_order

  def initialize(order = Order.new, menu = Menu.new)
    @order = order
    @menu = menu
  end

  def add
    @order.add()
  end

  def display_menu
    @menu.display
  end

  def receipt
    @order.receipt
  end
end