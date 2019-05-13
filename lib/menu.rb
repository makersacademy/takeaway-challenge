class Menu
  attr_reader :menu_items

  # MENU_ITEMS = { "Pizza" => 10,
  #   "Pasta" => 12,
  #   "Spaghetti" => 8 }

  def initialize
    @menu_items = { "Pizza" => 10,
      "Pasta" => 12,
      "Spaghetti" => 8 }
  end

  def print_menu
    @menu_items.each { |dish, price| puts "#{dish}: £#{price}" }
  end

end
