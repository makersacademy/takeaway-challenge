require 'bigdecimal'

class OrderTotal
  def calculate(order_lines)
    total = BigDecimal.new(0)
    order_lines.each {|dish, quantity| total += (dish.price * quantity)}
    total.to_f
  end
end
