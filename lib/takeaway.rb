require_relative 'order'

class Takeaway

attr_reader :order, :selected

  def initialize(order = Order.new)
    @order = order
  end

  def list_menu
     order.menu.dishes
  end


  def add_item(dish, qty = 1)
    order.add(dish, qty)
  end

  def sum
    order.summary
  end

end
