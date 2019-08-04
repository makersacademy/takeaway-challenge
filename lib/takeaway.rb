require './lib/menu.rb'
require './lib/order.rb'

class Takeaway

  attr_reader :order, :menu

  def initialize(order=Order.new,menu=Menu.new)
    @order = order
    @menu = menu
  end

  def menu_select(order, amount = 1)
    amount.times { @order.basket << @menu.menu_list.slice(order) }
  end

  def make_payment(payment)
    price = @order.total_price
    fail "Incorrect payment: The order total is £%.2f" % price unless payment == price
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

# test = Takeaway.new
# test.menu_select(:pepperoni, 2)
# test.menu_select(:awesome_sauce, 1)
# test.order.basket
# test.order.calculate_price
# test.order.total_price
# puts test.make_payment(24)
