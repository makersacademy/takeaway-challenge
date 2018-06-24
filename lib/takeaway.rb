require_relative 'menu'
require_relative 'order'

class Takeaway

  attr_reader :menu, :order

  def initialize(menu, order = Order.new)
    @menu = menu
    @order = order
  end

  def show_menu
    menu.print_dishes
  end

  def place_order(customer_order)
    customer_order.each do |dish, qty|
      @order.add(dish, qty)
    end
  end

  def total
    order.total
  end

  def basket
    display = []
    order.basket.each do |item, qty|
      display << "#{ item.capitalize } #{qty} £#{ '%.2f' % (menu.price(item) * qty) }"
    end
    display.join(", ")
  end

end
