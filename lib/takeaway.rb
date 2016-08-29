require_relative 'menu'
require_relative 'order'
require_relative 'text'

class Takeaway

  attr_reader :menu, :order

  def initialize(menu = Menu.new, order = Order.new)
    @menu = menu
    @order = order
  end

  def show_menu
    menu.display_dishes
  end

  def add(dish, quantity)
    fail 'That dish is not available' unless show_menu.include?(dish)
    order.select_dishes(dish, quantity)
  end

  def view_order
    view = order.selected_dishes
    "Your selected dishes are #{view}"
  end

  def order_price
    "Your total order price is £#{order.total_price}"
  end

  def amount?(price)
    price == order.total_price
  end

  def check_order_price(price)
    order.amount?
  end


  def order_confirmation
    order.confirm_order
  end
end
