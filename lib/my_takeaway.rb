require './lib/menu.rb'
require './lib/order.rb'


class Takeaway
  attr_reader :menu, :order

  def initialize(menu = Menu.new, order = Order.new)
    @menu = menu
    @order = order
  end

  def open_menu
    menu.view
  end

  def place_order(item, num = 1)
     order.select(item, num)
     "#{item} x #{num} added to your basket."
  end

  def view_basket
    order.current_basket
  end

def total_cost
  order.cost
end

end
