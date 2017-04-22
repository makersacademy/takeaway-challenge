class Print

  def print_menu(menu)
    menu.cuisine.each do |dish, price|
      print "#{dish.to_s.capitalize}, £#{price}\n"
    end
  end

  def add_to_basket(dish, quantity = 1)
    return "#{quantity}x #{dish.downcase}(s) added to basket"
  end

  def unavailable(dish)
    return "Unfortunately #{dish} isn't available"
  end

  def view_basket(items, menu)
    print "Basket:\n"
    items.each do |dish, quantity|
      price = menu.cuisine[dish] * quantity
      print "#{quantity}x #{dish}(s) = £#{price}\n"
    end
  end

end
