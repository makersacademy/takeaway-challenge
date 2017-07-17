require_relative 'menu'
require_relative 'order'

class Takeaway
  def initialize
    @menu = Menu.new
    @order = Order.new
    @complete = false
  end

  def read_menu
    @menu.display_menu
  end

  def order(dish, quantity)
    @order.add(dish, quantity)
    "#{quantity}x #{dish.capitalize}(s) added to your basket."
  end

  def view_basket
    @order.display_basket
  end

  def display_total
    @order.display_total
  end

  def total
    @order.total
  end

  def order_complete(price)
    fail 'price does not match total price' if is_correct_amount?(price)
    complete?
  end

  def is_correct_amount?(price)
    @order.total == price
  end

  def complete?
    @complete = true
  end
end
