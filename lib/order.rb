require 'time'
class Order
  attr_reader :order
  def initialize(menu)
    @menu = menu
    @order = {}
    @total = 0
  end

  def add_item_to_order(item, quantity)
    @order[item.to_sym] = [@menu[item.to_sym], quantity]
    @order
  end

  def check_order
    puts '---Your Shopping List---'
    @order.each do |key, value|
      puts key.to_s.ljust(10) + value[1].to_s + " €" + value[0].to_s
      @total += value[1] * value[0]
    end
     puts "--- Total = €#{@total} ---"
     "--- Total = €13 ---"
  end

 def times
   clock = Clock.new
   clock.times
 end

  def place_order(total)
    return "Thank you! Your order was placed and will be delivered before #{times}" if total == @total
    raise "Sorry we don't hangel" if total < @total
    raise "To much try again" if total > @total
  end
end
