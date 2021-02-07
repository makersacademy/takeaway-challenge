require 'order'

class Checkout

  def initialize
    @total = 0
  end

  def order_checkout(order)
    order.each { |item| puts "Dish: #{item[:dish]} Price: £#{item[:price]}" }
    puts " Total to pay - £#{order_total(order)}"
    @total
  end
  
  private

  def order_total(order)
    order.each { |item| @total += item[:price]}
    @total
  end
end