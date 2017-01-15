require './lib/menu'
require './lib/order'

class Takeaway
attr_accessor :order
  def initialize
    @menu = Menu.new
  end

  def view_menu
    p @menu.menu
  end

  def place_order
    prompt
    orderloop
    print_order
  end

  def prompt
    p 'Please input your order. End by pressing Enter twice.'
  end

  def input_order(order)
    @order.add(order)
  end

  def orderloop
    @order = Order.new
    order = gets.chomp
    while order != ''
      input_order(order)
      order = gets.chomp
    end
  end

  def print_order
    p 'Thanks. Printing order for review:'
    p @order, "Total: " + @order.each (0) {|x, y| +=y }
  end
end
