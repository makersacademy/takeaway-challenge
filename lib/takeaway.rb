class Takeaway

  DEFAULT_DISHES = {
    "Pizza" => Dish.new('Pizza', 1.50),
    "Sushi" => Dish.new('Sushi', 16.00)
  }

  def initialize(dishes = DEFAULT_DISHES, order_class = Order)
    @dishes = dishes
    @order_class = order_class
  end

  def dishes
    @dishes.values.reduce('') do |memo, dish|
      "#{memo}#{dish.to_s}\n"
    end
  end

  def order(order_string, customer_total)
    @order_class.new()

  end
end