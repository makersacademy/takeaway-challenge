require './lib/menu.rb'
require './lib/order.rb'

class Takeaway

  attr_reader :order, :menu

  def initialize
    @order = Order.new
    @menu = Menu.new
  end

  def menu_select(order, amount = 1)
    amount.times { @order.basket << @menu.menu_list.slice(order) }
  end

  def view_basket
    @order.basket
  end

  def view_menu
    @menu.menu_list
  end

  def view_total_price
    @order.total_price
  end

end

test = Takeaway.new
test.menu_select(:pepperoni, 2)
puts test.view_menu
