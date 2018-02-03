require_relative 'order'
require_relative 'menu'

class Takeaway

  attr_reader :menu, :order, :total

  def initialize
    @menu = Menu.new.items
    @total = 0
    @order = Order.new
  end

  def new_order(dish)
    order = { dish => @menu[dish] }
    @order.save_order(order)
  end

  def order_total
    order.items.each do |item|
      item.each_value { |price| @total += price }
    end
    @total
  end
end
