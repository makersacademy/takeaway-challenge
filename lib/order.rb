class Order
  attr_reader :items_ordered, :items_price

  def initialize
    @items_ordered = []
    @items_price = []
  end

  def order_total
    @items_price.sum
  end

  def order_details
    puts "ORDER DETAILS\n"
    i = 0
    while i < @items_ordered.length do
      puts "* #{@items_ordered[i]} --- £#{items_price[i]}"
      i += 1
    end
    puts "TOTAL BILL: £#{order_total}"
  end

end
