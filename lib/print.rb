class Print

  def print_menu(dishes)
    dishes.each do |dish, price|
      print "#{dish.to_s.capitalize}, £#{price}\n"
    end
  end

  def add_to_basket(dish)
    return "1x #{dish.downcase}(s) added to basket"
  end

  def dish_unavailable(dish)
    return "Unfortunatley #{dish} isn't available"
  end

end
