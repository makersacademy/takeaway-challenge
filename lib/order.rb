class Order

  def initialize
    @order_list = []
  end

  def add_item(item)
    @order_list.push(item)
  end

  def check_order
    puts "\nYour order currently contains:"
    @order_list.each do |item|
      puts "\t#{item.name}....£#{item.price}"
    end
    puts ""
  end

  def print_final_order
    puts "#{check_order}\nThe total cost of your order is: £#{total}."
  end

  def total
    @total = 0
    @order_list.each do |item|
      @total += item.price
    end
    @total
  end
end
