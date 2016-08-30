require_relative 'order'
require_relative 'menu'

class TakeAway
  attr_reader :menu, :total, :order

  def initialize(menu = Menu.new, order = Order.new)
    @menu = menu
    @order = order
    @total = 0
  end

  def show_menu
    @menu.menu_list
  end

  def take_order(dish, quantity=1)
    fail "Sorry this item is not on the menu" if @menu.dishes[dish].nil?
    @order.add(dish, quantity)
    "#{quantity}x #{dish}(s) added to your basket."
  end

  def summary
    return order.order_summary
  end

  def total_cost
    @total = order.cost(menu)
    "Your total bill comes to: £#{total}"
  end

  def empty?
    @basket == 0
  end
end
