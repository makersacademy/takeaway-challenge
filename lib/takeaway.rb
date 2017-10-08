require_relative './order'
require_relative './restaurant'

class Takeaway
  attr_reader :order, :basket, :total_price

  def initialize
    @order = {}
  end

  def add(item)
    item = item.to_sym
    calculate_dishes(item)
    item
  end

  def view_basket
    process_basket
    puts @basket
  end

  def complete_order(order_input, price_input)
    process_basket
    restaurant = Restaurant.new(order, total_price, order_input, price_input)
    restaurant.process 
  end

private
  def calculate_dishes(item)
     order[item] == nil ? order[item] = 1 : order[item] += 1
  end

  def process_basket
    process_order = Order.new(order)
    process_order.calculate_total
    @total_price = process_order.total_price
    @basket = process_order.basket
  end

end
