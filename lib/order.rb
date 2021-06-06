require_relative 'menu'

class Order
  attr_reader :order

  def initialize
    @order = []
  end

  def menu
    Menu.each { |item, price| puts "#{item}: £#{price}" }
  end

  def add_item(food, quantity = 1)
    quantity.times { @order << food.to_sym }
  end

  def total
    order_total = 0
    @order.each { |item| order_total += Menu[item] }
    order_total
  end

end