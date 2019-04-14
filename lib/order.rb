class Order
  attr_reader :current_order

  def initialize
    @current_order = []
    @order_total = 0
  end

  def add_item(item)
    @current_order << item
  end

  def add_price(price)
    @order_total += price
  end

  def display_order
    puts "Current Order"
    puts "-----------"
    @current_order.each { |item|
      item.each { |item, price|
      puts "#{item}: £#{price}" }
    }
    puts "Total: £#{@order_total}"
  end
end
