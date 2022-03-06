require_relative 'dish'
require_relative 'order_item'

class Order

  attr_reader :basket, :order_status

  def initialize
    @basket = []
    @order_status = "pending"
  end

  def add(order_item)
    raise "Sorry, dish unavailable" if order_item.dish.available? == false
    @basket << order_item
  end

  def print_order
    @basket.each { |order_item|
     puts "#{order_item.quantity} x #{order_item.dish.name}"
    }
  end

  def calculate_total
    total = 0
    @basket.each { |order_item| total += (order_item.quantity * order_item.dish.price) }
    return total
  end

  def verify_total(bill)
    raise "Bill does not match the total sum of dishes ordered" if bill != calculate_total
    return true
  end

  def place_order
    @order_status = "accepted" 
  end
end