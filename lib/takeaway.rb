require_relative 'order'


class Takeaway

  def print_menu
    @menu.print_menu
  end

  def place_an_order(dish, qnty = 1)
    @order = Order.new if @order.nil?
    @order.place_an_order(dish, qnty)
  end

  def display_basket
    @order.basket.display_basket
  end

  def total
    @order.total
  end

  def complete(price)
    @order.complete(price)
  end

end
