class MenuPrinter
  def display_menu(menu)
    menu.each_pair { |dish, price| p "Dish: #{dish}, price: £#{price}" }
  end
end
