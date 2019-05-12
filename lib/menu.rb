class Menu
  attr_reader :menu

  MENU_ITEMS = { "Pizza" => 10,
    "Pasta" => 12,
    "Spaghetti" => 8 }

  def initialize
    @menu_items = MENU_ITEMS
  end

  def print_menu
    @menu_items.each { |dish, price| puts "#{dish}: £#{price}" }

  end

end
