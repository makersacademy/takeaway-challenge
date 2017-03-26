# Select menu items, quantities and place order.
require './lib/menu.rb'
require './lib/order.rb'

class Takeaway

  attr_reader :menu, :order

  def initialize
    @menu = Menu.new
    @order = Order.new
  end

  def read_menu
    @menu.read_menu # TESTED
  end

  def order(item, quantity = 1)
    @order.add_items(item, quantity)
    "#{quantity}x #{item}(s) added to your basket." # TESTED
  end

  def basket_summary
    @order.basket
  end

  def total
    "Your total order is: £#{@order.total}"
  end

  def checkout(amount)
    @order.payment(amount)
  end

end
