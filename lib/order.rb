
class Order
  def initialize
    @order_list = []
  end

  def add_order_line(dish, quantity)
    raise 'not a dish' unless dish.is_a? Dish
    raise 'quantity less than 1 not allowed' unless quantity.positive?

    order_line = {
      dish: dish.name,
      price: dish.price,
      quantity: quantity,
      line_total: quantity * dish.price.to_f
    }
    @order_list << order_line
    @order_list
  end

  def calculate_total
  end

  def submit_order
  end
end
