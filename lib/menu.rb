require_relative 'order'

class Menu

  attr_reader :dishes, :selected, :order

  def initialize
    @dishes = {
      pizza: 10,
      bolognese: 8,
      risotto: 9,
      red_wine: 4,
      white_wine: 4.50
     }
    @order = Order.new
  end

  def new_order(dish)
    order = { dish => @dishes[dish] }
    @order.save_order(order)
  end
end
