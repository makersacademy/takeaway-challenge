require_relative 'order'

class Takeaway

  attr_reader :menu, :order, :total

  def initialize
    @menu = {
      pizza: 10,
      bolognese: 8,
      risotto: 9,
      red_wine: 4,
      white_wine: 4.50
     }
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
