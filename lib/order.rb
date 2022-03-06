class Order

  def initialize
    @order = []
  end

  attr_reader :order

  def add_to_order(dish)
    @order << dish
  end

  def show_my_order
    total_cost = 0
    @order.each do |item|
      puts "#{item.name}: £#{item.price}"
      total_cost += item.price
    end
    puts "Total Price: £#{total_cost}"
  end
end