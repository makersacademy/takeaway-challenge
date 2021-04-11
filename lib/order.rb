class Order

  attr_accessor :dish_to_order, :customer_order, :order_cost, :order_completed,
                :order_started, :cost_of_dish

  def initialize
    @customer_order = []
    @order_cost = 0
    @order_started = false
    @order_completed = false
  end

  def show_current_order
    @customer_order = []
  end

  def add_to_order(dish, quantity)
    number_added = 0
    while number_added != quantity
      @customer_order << dish
      number_added += 1
    end
    @order_started = true
    p @customer_order
  end

  def price_check
    @order_cost += 8
  end

  def cost(quantity)
    @cost_of_dishes = @cost_of_dish * quantity.to_i
    @order_cost += @cost_of_dishes.to_i
  end

end
