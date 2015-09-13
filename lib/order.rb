class Order

  attr_reader :order
  attr_reader :amount

  def initialize
    @order = []
    @amount = []
  end

  def add_to_order dish, quantity
      amount << quantity
      order << dish
  end

  def place_order
    puts "Your order:\n"
    total = 0
    count = 0
    order.each do |dish|
      quantity = order.count(dish)
      puts "#{dish.show_details} X#{amount[count]}"
      total += (dish.price * amount[count])
      count += 1
    end
    puts "Total: £#{sprintf('%.2f', total)}"
  end

end
