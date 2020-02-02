require 'menu'
class Restaurant

  attr_reader :current_order

  def initialize
    @current_order = []
  end

  def add_to_order(dish_name, qty)
    @current_order << dish_name
    dish_name.update_qty(qty)
  end
  
  def review_order
    @current_order.map(&:name).join(", ")
  end
  
  def pay_order(amount)
    raise "Sorry, this is not enough to cover the cost of the meal!" if amount != order_total

    "Your order has been confirmed! A text message will be sent shortly."
  end

  private
  def order_total
    total = 0
    @current_order.each do |dish|
      total += dish.price
    end
    return total
  end
end
