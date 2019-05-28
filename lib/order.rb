require 'bigdecimal'

class Order

  attr_reader :time

  def initialize(time = Time.now)
    @order_items = []
    @time = time
  end
 
  def add(dish)
    @order_items.push(dish)
    total
  end

  def total
    @order_items.reduce(BigDecimal(0, 4)) do |memo, item|
      memo + item.price
    end
  end

  def delivery_time
    (@time + (60 * 60)).strftime('%H:%M')
  end
end
