# As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given matches the sum of the various dishes in my order

require_relative 'menu'

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
