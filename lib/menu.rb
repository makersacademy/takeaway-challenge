class Menu

  MENU = [
    {:dish => "Cod", :price => 8.25},
    {:dish => "Haddock", :price => 8.75},
    {:dish => "Sausage", :price => 8.25},
    {:dish => "Chips", :price => 3.95},
    {:dish => "Gravy", :price => 0.95},
    {:dish => "Roll", :price => 1.25},
    {:dish => "Coke", :price => 1.75},
    {:dish => "Fanta", :price => 1.75}
  ]

  def view_menu
    MENU
  end

  def view_formatted_menu(menu = MENU)
    format_menu(menu)
  end

  def contains?(item)
    item.downcase.to_sym
    MENU.detect { |food| food[:dish] == item } != nil
  end

  private

  def format_menu(menu)
    formatted_menu = []
    menu.each { |item| formatted_menu << "#{item[:dish]} - £#{item[:price]}" }
    formatted_menu.join("\n")
  end

end

puts Menu.new.view_formatted_menu