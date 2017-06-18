

# Understands how to print resturant things.

class Printer

  def print_(dish, i, price)
    puts "#{i += 1}. #{dish} -- £#{price}"
  end

  def print_all(dishes)
    i = 0
    dishes.each { |dish, price| print_(dish, i, price); i += 1 }
  end

  def print_an_order_of(food, quant)
    puts "Dish: #{food} X#{quant}."
  end

  def print_all_orders_in(basket)
    basket.each { |food, quant| print_an_order_of(food, quant) }
  end

  def print_the(total)
    puts "Total cost: #{total}"
  end

end
