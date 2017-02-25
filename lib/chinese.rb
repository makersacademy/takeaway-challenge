class Chinese

  def restaurant_menu
    menu = {"Charsui pork" => 5, "Choisum" => 3, "Drink" => 1}
    print_menu(menu)
  end

  def print_menu(menu)
    menu.each { |k, v| puts "#{k} - £#{v}" }
  end

end
