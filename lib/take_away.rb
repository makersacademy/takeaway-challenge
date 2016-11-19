require_relative "order"

class TakeAway

  def initialize(order_klass)
    @order = order_klass.new(Menu)
  end

  def menu
    @order.menu
  end

  def add_to_basket(dish,number)
    @order.add(dish,number)
    "You added #{number} x #{dish} to the basket."
  end

  def check_price(my_price)
    my_price == total_price
  end

  def total_price
    @order.total
  end


end
