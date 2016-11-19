class Menu

  MENU = {
    "pepperoni" => 10,
    "vegetable" => 8,
    "margherita" => 8,
    "garlic bread" => 3,
    "chips" => 3,
    "coca-cola" => 2
  }

  def show_menu
    line_width = 30
    MENU.each do |item, price|
      puts "#{item}".ljust(line_width / 2) + "£#{price.to_s}".rjust(line_width / 2)
    end
  end

end
