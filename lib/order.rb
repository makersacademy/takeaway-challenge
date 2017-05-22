require_relative 'menu'

class Order

  attr_reader :current_order

  def initialize(dish, price)
    @current_order = [{dish => price}]
    @order_total = 0
  end

  def add(new_dish, price)
    @current_order << {new_dish => price}
  end

  def order_total
    @current_order.each do |d|
      d.each {|name, cost| @order_total += cost}
    end
    @order_total
  end

end
