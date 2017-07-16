# this class contains an order of dishes chosen from the menu
require_relative 'menu'

class Order

  attr_reader :current_order, :total_price

  def initialize(new_order)
    @current_order = new_order
  end

  def print_order
    print_result = "Summary of your order: "
    current_order.each { |item| print_result << "#{item[:dish]} #{item[:quantity]}x, " }
    total_price_calculation
    print_result << "total price £#{total_price}"
  end

  def total_price_calculation
    sum = 0
    current_order.each { |item| sum += item[:price] }
    @total_price = sum
  end
end
