class Interface
  def initialize(menu = nil, order = Order.new)
    @menu = menu
    @order = order
  end

  def get(choice, quantity)
    @order.add(choice, quantity)
  end

  def show_total
    @order.total
  end

  def show_order
    @order.show
  end

  def checkout(money)
    raise "sums don't match!" if money < show_total
  end
end
