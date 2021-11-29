class Takeaway

  def initialize
    @order_selection = []

  end

  def add_order(food, price)
    @menu[order] = price
    @order_selection << food
  end

  def total_order
    sum = 0
    @order_selection.each_value { |price| sum += price }
    sum
  end
end
