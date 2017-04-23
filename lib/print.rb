module Print

  def print_order(item, quantity)
    puts "#{quantity} x #{item} added to your basket."
  end

  def print_menu
    menu.dishes.each_pair { |dish, price| puts "#{dish}: £#{price}" }
  end

  def print_basket
    basket.each_pair do |food, cost_quant|
      puts "#{food} @ £#{cost_quant[0]} = £#{cost_quant.reduce(:*)}"
    end
  end

  def print_total
    puts "Total: £#{subtotal}"
  end

end
