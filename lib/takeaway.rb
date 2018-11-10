require_relative 'order'

class Restaurant

  def initialize(order = Order.new)
    @order = order
  end

  def menu
    @order.menu
  end

  def make_order(item, how_many)
    @order.buy_item(item, how_many)
  end

  def basket
    @order.basket
  end

  def price
    @order.total
  end

end
