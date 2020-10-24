class Order

  attr_accessor :dish_to_order, :customer_order, :order_cost, :order_completed, :order_started

  def initialize
    @customer_order = []
    @order_cost = 0
    @order_started = false
    @order_completed = false
  end

  def show_current_order
    @customer_order = []
  end

  def add_to_order(number_of_dish, quantity)
    @customer_order.fill(@dish_to_order, @customer_order.size, quantity.to_i)
    show_current_order
  end

  def price_check
    @order_cost += 8
  end

end
