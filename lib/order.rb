# As a customer
# So that I am reassured that my order will be delivered on time
# I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered

require_relative 'menu'
require_relative 'message'

class Order

  attr_reader :current_order

  def initialize
    @menu = Menu.new
    @current_order = []
    @order_total = 0
  end

  def view
    @menu.view
  end

  def order(num, amount)
    amount.times { @current_order << @menu.select(num)}
  end

  def total
    @current_order.each do |item|
      puts "#{item[:item]}: #{item[:price]}"
      @order_total += item[:price]
    end
    puts "current order total is £%0.2f" % [@order_total]
  end

end
