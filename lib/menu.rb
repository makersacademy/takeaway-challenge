class Menu

  MENU = [
    { "Buckwheat Shamalam" => 5.00 },
    { "Avocado Foxtrot" => 6.50 },
    { "Spinach Snickerdoodle" => 4.50 },
    { "Froffee Coffee" => 3.50 },
    { "Entitea" => 2.00 },
    { "Nobody Knows" => 10.00 }
  ]

  def print_menu
    MENU.each { |item| item.each do |key, value|
      return "#{key}, #{value}0"
    end
    }
  end
end
