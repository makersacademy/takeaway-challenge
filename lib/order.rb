
class Order
  attr_reader :current_order

  def initialize(dish, price)
    @current_order = [{ dish => price }]
    @order_total = 0
  end

  def add_to_order(dish, price)
    @current_order << { dish => price }
  end

  def order_total
    @current_order.each do |item|
      item.each {|dish_name, dish_price| @order_total += dish_price}
    end
    @order_total
  end


end
