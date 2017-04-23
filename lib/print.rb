module Print

  def print_menu
    puts "","Basket".center(20),"*"*23
    @menu.cuisine.each{ |dish, price| puts "#{dish.to_s.capitalize.ljust(20)} £#{price}\n" }
  end

  def add_to_basket(dish, quantity = 1)
    return "#{quantity}x #{dish.downcase}(s) added to basket"
  end

  def print_unavailable(dish)
    return "Unfortunately #{dish} isn't available"
  end

  def view_basket(quantity, dish, price)
    print "#{quantity}x #{dish}(s) = £#{price}\n"
  end

  def incorrect_total(total)
    return "Error: Incorrect input, total is: £#{total} "
  end

  def print_total(total)
    return "Total: £#{total} Would like to checkout or add more to your order?"
  end

  def print_checkout(total)
    return "Order successful! You have paid £#{total}. Please await text confirmation"
  end

end
