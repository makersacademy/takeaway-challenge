require_relative './menu'
# Creates and checks out customer orders.

class Order
  attr_reader :current_order

  def initialize
    @current_order = []
  end

  def add_to_order(dish)
    @current_order << [dish.name, dish.price]
  end

  def view_order_summary
    puts "YOUR ORDER"
    print_current_order_array
    print_order_total
  end

  private

  def print_current_order_array
    @current_order.each { |name, price| puts "#{name}, £#{price}" }
  end

  def print_order_total
    total = 0
    @current_order.each { |name, price| total += price.to_i }
    puts "Your total: £#{total}"
  end
end
