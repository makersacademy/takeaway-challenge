require 'bigdecimal'

class Order

  def initialize
    @order_items = []
  end
 
  def add(dish)
    @order_items.push(dish)
    total
  end

  def total
    @order_items.reduce(BigDecimal(0, 4)) do |memo, item|
      memo += item.price
    end
  end

end