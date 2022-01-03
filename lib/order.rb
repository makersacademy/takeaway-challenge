
class Order
  attr_reader :order

  def initialize
    @order = []
  end

  def add(menu, dishes)
    dishes.each do |dish|
      @order << menu[dish - 1]
    end
  end

  def summary
    raise "Your order is empty" if @order.empty?
  
    puts "Your current order:\n\n"
    
    total = 0

    @order.each do |item|
      puts "#{item[:name]}: #{item[:price]}"

      total += item[:price]
    end

    puts "\nOrder total: #{total}"
  end
end
