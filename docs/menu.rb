class Menu

  attr_reader :menu_items

  def initialize
    @menu_items = { "Haddock" => 5,
      "Cod" => 6,
      "Chips" => 3,
      "Curry Sauce" => 1,
      "Scraps" => 1 }
  end

  def show_menu
    menu_array = []
    @menu_items.each { |dish, price| menu_array.push("#{dish} - £#{price}") }
    menu_array
  end

end
