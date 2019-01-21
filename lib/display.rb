class Display

  def to_string(menu)
    menu_to_list = ""
    menu.map { |dish|
      menu_to_list << "#{dish.dish_name} at £#{sprintf('%.2f', dish.price)}\n"
    }
    return menu_to_list
  end
end
