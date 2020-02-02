class Restaurant

  attr_reader :current_order

  def initialize
    @current_order = []
  end

  def add_to_order(dish_name)
    @current_order << dish_name
  end
  
  def review_order
    @current_order.join(", ")
  end
  
  def pay_order(amount)
    "Your order has been confirmed! A text message will be sent shortly."
  end

end
