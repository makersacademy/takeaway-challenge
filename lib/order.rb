class Order

  def initialize
    @order_list = []
  end

  def add_item(item)
    @order_list.push(item)
  end

  def check_order
    @order_list.each do |item|
      puts "#{item.reference}....#{item.name}....£#{item.price}"
    end
  end

  def print_final_order
    "#{check_order}\nThe total cost of your order is: £#{total}."
  end

  def total
    @total = 0
    @order_list.each do |item|
      @total += item.price
    end
    @total
  end
end
