require_relative 'menu'
require_relative 'order'

class Takeaway

  attr_reader :menu, :order

  def initialize(menu=Menu.new)
    @menu = menu
    @order = Order.new
  end

  def show_menu
    menu.print_menu
  end

  def place_order(dish,quantity)
    order.add(dish,quantity)
  end

  def sub_total
    order.dish_price
  end

  def total_amount
    order.total
  end

  def complete_order(price)
    fail "Sorry, sum is not correct" unless correct_amount?(price)
  end

private

  def correct_amount?(price)
    total_amount == price
  end
end
