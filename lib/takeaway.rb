require_relative 'menu'
require_relative 'order'

class Takeaway
  attr_reader :menu, :order

  def initialize
    @menu = Menu.new
    @order = Order.new
  end

  def add_item(item, quantity = 1)
    @order.add(item, quantity, @menu.price(item))
  end

  def order_total
    @order.total
  end

  def check_order
    @order.order.each { |x| puts "#{x[:quantity]} X #{x[:item]} for £#{x[:price]} each" }
  end
end
