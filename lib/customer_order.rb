class CustomerOrder

  attr_reader :order_dishes, :add_items
  attr_accessor :order_total

  def initialize(order_dishes=Hash.new(0))
    @order_dishes = order_dishes
    @order_total = 0.00
  end

  def add_items(item, qty, price)
    @order_total = (@order_total + (price * qty))
    order_dishes[item] = qty
  end

  def display_order
    order_dishes.each_key do |dish| 
# TODO calculating line totals would be nice.
      puts "#{order_dishes[dish]} x #{dish}"     
    end
    puts "Order total: £#{sprintf('%.2f', order_total)}"
  end

end