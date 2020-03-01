require 'order'
require 'text'
class Takeaway
  attr_reader :order
  include Text
  def initialize(order: Order.new)
    @order = order
  end

  def view_order
    items = order.view_order
    items.each { |k, v| puts "Item: #{k}  Qty: #{v} }" }
  end

  def view_menu
    menu = order.view_menu
    menu.each { |k, v| puts "Item: #{k}  price: #{v} " }    
  end

  def add(dish, quantity)
    @order.add_dish(dish, quantity)
  end
 
  def view_total
    "Total amount to be paid is € #{@order.total_price}"
  end

  def place_order(payment)
    fail "Payment does not match order total" if confirm_payment(payment)

    Text.send
  end

  def confirm_payment(payment)
    @order.total_price != payment
  end
end
