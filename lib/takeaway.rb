require_relative 'order'
require_relative 'menu'

class Takeaway

  attr_reader :menu, :order, :total

  def initialize
    @menu = Menu.new.items
    @total = 0
    @order = Order.new
    @final_order = {}
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

  def place_order
    order_total
    @order.items.each do |item|
      item.each_key { |food|
        if @final_order.key?(food)
          @final_order[food] += 1
        else @final_order[food] = 1
        end
      }
    end
    keys = @final_order.keys
    print "you have ordered #{@final_order[keys[0]]} for a total of #{@total}"
  end

end
