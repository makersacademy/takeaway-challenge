
# This will be populated with the customer's menu choices and will contain the order total.
class Order
  attr_reader :order, :total

  @@count = 0

  def initialize
    @order = []
    @total = 0
    @@count += 1
  end

  def order_number
    @@count
  end

  def add_to_order(dish_number, quantity)
    @order << { dish: dish_number, quantity: quantity }
  end
end
