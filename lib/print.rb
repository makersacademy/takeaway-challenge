module Print

  def print_menu(menu)
    menu.cuisine.each { |dish, price| "#{dish.to_s.capitalize}, £#{price}\n" }
  end

  def add_to_basket(dish, quantity = 1)
    return "#{quantity}x #{dish.downcase}(s) added to basket"
  end

  def unavailable(dish)
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
    return "Order succesful! You have paid £#{total}. Please await text confirmation"
  end

end
