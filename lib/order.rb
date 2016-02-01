class Order

  def initialize
    @order_list = []
    @total = 0
  end

  def add_item(item)
    @order_list.push(item)
  end

  def check_order
    puts "\nYour order currently contains:"
    @order_list.each do |item|
      puts "\t#{item.name}....£#{item.price}\n\n"
    end
  end

  def show_list
    @order_list.clone.freeze
  end

  def print_final_order
    total
    puts "#{check_order}\nThe total cost of your order is: £#{@total}"
  end

  def total
    @order_list.each do |item|
      @total += item.price
    end
    @total
  end
end
