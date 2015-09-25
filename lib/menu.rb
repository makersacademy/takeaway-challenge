
module Menu

  MENU = {pizza: 12.99, potato_wedges: 3.99, nachos: 3.99,
    chicken_wings: 8.99, dip: 0.49}

  def price(dish)
    MENU[dish]
  end

end