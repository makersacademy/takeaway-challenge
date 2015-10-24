class OrderTotal
  def calculate(order_lines)
    total = 0.0
    order_lines.each {|dish, quantity| total += (dish.price * quantity)}
    total
  end
end
