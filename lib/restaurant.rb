class Restaurant
  def initialize(menu = Menu.new, order_klass = Order)
    @menu = menu
    @order_klass = order_klass
  end

  def read_menu
    @menu.display
  end

  def order(item, quant = 1)
    new_order
    @current_order.add(item, quant)
  end

  private

  def new_order
    @current_order ||= @order_klass.new @menu
  end
end
