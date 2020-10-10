class Printer
  def print_dish(dish)
    puts "#{dish.name} - £#{dish.price}\n"
  end

  def print_total(basket)
    puts "Total Price: £#{basket.total_price}"
  end

  def print_basket(basket)
    basket.dishes.each {|dish, quantity| quantity.times{print_dish(dish)}}
    print_total(basket)
  end
end