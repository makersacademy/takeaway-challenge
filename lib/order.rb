# It is responsbile for compiling a user's order
require_relative 'menu'

class Order

  attr_reader :current_order, :order_time

  def initialize(menu_item, price)
    @current_order = [{ menu_item => price }]
    @order_total = 0.0
    @order_time = Time.now
  end

  def add_to_order(new_item, price)
    @current_order << { new_item => price }
  end

  def order_total
    @current_order.each do |dish|
      dish.each { |_dish_name, dish_cost| @order_total += dish_cost }
    end
    @order_total
  end

  def print_order_detail
    @current_order.each do |item|
      item.each do |menu_item, price|
        p "#{menu_item} - #{price}"
      end
    end
  end

end
