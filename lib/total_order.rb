class TotalOrder

  def initialize
    @total_order = []
  end

  def add_to_order(order)
    @total_order << order.item_to_order
  end

  def confirm_order(total_price)
    @total_order.each do |item|
      puts "Dish: #{item[:dish]}, Quantity: #{item[:quantity]}"
    end
    # total_price.print_total_price
  end

end
