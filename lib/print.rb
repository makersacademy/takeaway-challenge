class Print

  def print_dishes(dishes)
    dishes.each do |key, value|
      print "#{key.to_s.capitalize}, £#{value}\n"
    end
  end

  def add_to_basket(dish)
    return "1x #{dish.downcase}(s) added to basket"
  end

end
