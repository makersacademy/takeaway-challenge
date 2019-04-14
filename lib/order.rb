class Order
  attr_reader :current_order

  def initialize
    @current_order = []
    @order_total = 0
  end

  def add_item(item)
    @current_order << item
  end

  def order_total
    @current_order.each { |item|
      item.each { |_item, price|
        @order_total += price
      }
    }
    @order_total
  end

  def display_order
    puts "Receipt"
    puts "-----------"
    @current_order.each { |item|
      item.each { |item, price|
      puts "#{item}: £#{price}" }
    }
    puts "Total due: £#{order_total}"
  end
end
