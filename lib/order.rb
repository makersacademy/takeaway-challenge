class Order

  attr_reader :order

  def initialize(order)
    @order = order
  end

  def print_order
    line_width = 50
    puts "Item No.".ljust(line_width) + "Dish".center(line_width) + "Price".ljust(line_width)
    order.each do |dish|
      dish.each do |item|
        print item.ljust(line_width)
      end
    end
  end

  def confirm_total
    total = 0
    order.each do |item|
      price = item.last.to_f
      total += price
    end
    total
  end

end
