
class Order
  attr_reader :order

  def initialize
    @order = []
  end

  def add(dish)
    @order << (dish)
  end

  def summary
    raise "Your order is empty" if @order.empty?
    
    print_order_summary
  end

  private

  def print_order_summary
    puts "Your current order:\n\n"
    total = 0
    @order.each do |item|
      puts "#{item[:name]}: #{item[:price]}"
      total += item[:price]
    end
    puts "\nOrder total: #{total}"
  end
end
