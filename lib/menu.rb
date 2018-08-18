class Menu

  DISHES = {
    pizza: 7.50,
    burger: 6.50,
    pasta: 5.00
  }

  def print_menu
    DISHES.map do |dish, price|
      # had to check the example on github to find how to do this
      "%s £%.2f" % [dish.to_s.capitalize, price]
    end.join(", ")

  end



end
