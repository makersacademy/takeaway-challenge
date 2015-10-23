module Menu

  MENU = {Burger: 9.99, Pizza: 6.99, Chips: 1.99, Salad: 8.99}

  def view_menu
    MENU.map { |dish, price| "#{dish}: £#{'%.2f' % price}" }.join(", ")
  end

  def menu_include?(dish)
    MENU.include?(dish)
  end

end
