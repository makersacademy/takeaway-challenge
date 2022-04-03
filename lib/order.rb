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
    print_sorted_order
    print_order_total
  end

  def confirm_purchase
    raise "You have not added any dishes" if @current_order.empty?
    puts "Thank you! Your order was placed and will be delivered before #{time_of_delivery}!"
  end

  private

  def print_sorted_order
    @current_order.each { |name, price| puts "#{name}, £#{price}" }
  end

  def print_order_total
    total = 0
    @current_order.each { |_, price| total += price.to_i }
    puts "Your total: £#{total}"
  end

  def time_of_delivery
    (Time.now + 3600).strftime("%H:%M")
  end
end
