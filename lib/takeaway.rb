require_relative 'menu'
require_relative 'order'

class TakeAway
  attr_reader :menu, :order

  def initialize (menu = Menu.new, order = Order.new(menu))
    @menu = menu
    @order = order
  end

  def view_menu
    menu.print_menu
  end

  def add(dish, quantity)
    order.add(dish, quantity)
    "#{quantity} x #{dish} added to basket"
  end

  def review
    order.print_order
  end

  def checkout(total_sum)
    raise "Incorrect sum entered" if total_sum != order.sum
    confirmation
  end

  def confirmation
  end

end
