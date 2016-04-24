require_relative 'order'

class Restaurant

  def initialize
    @menu = {
       "Curry" => 5,
        "Rice" => 2,
        "Beer" => 3
    }
    @order = Order.new
  end

  def menu
    @menu.clone
  end

  def show_order
    @order.show_order
  end

  def add_to_order(dish, quantity = 1)
    @order.add_to_order(dish, quantity)
  end

end