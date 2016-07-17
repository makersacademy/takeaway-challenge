require_relative 'menu'
require_relative 'order'

include Menu

class Takeaway

  def initialize(order = Order.new)
    @order = order
  end

  def read_menu
    #puts "Here is the menu tonight:"
    Menu::read
  end

  def add(item, quantity)
    @order.add(item, ITEMS[item], quantity)
    #"quantity of item added"
  end

  def view_order
    #here are the items on your order
    @order.items
  end

  def check_total(customer_total)
    @order.check_total(customer_total)
  end

end
