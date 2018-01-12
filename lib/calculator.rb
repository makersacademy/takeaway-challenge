require_relative 'menu'
require_relative 'takeaway'

class Calculator

  def order_total(items)
    cost = 0
    items.each { |food, price|
    cost += price}
    cost
  end

end
