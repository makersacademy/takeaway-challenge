class Order

  attr_reader :order, :total

  def initialize(order)
    @order = order
    @total = 0
  end
  #
  # def print_order
  #   line_width = 30
  #   puts "Item No.".ljust(line_width) + "Dish".center(line_width) + "Price".ljust(line_width)
  #   order.each do |dish|
  #     dish.each do |item|
  #       puts item
  #     end
  #   end
  # end

  def confirm_total
    order.each do |item|
      price = item.last.to_f
      @total += price
    end
  confirm_message(total)
  end

  def confirm_message(total)
    puts "Thank you for your order."
    puts "The total for your order is £#{total}."
  end

end
