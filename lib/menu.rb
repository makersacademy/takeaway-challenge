class Menu
  attr_reader :items

  DEFAULT_ITEMS = [ 
    {"Soup of the day" => 3},
    {"Garlic bread" => 3},
    {"Pizza" => 11},
    {"Fish and chips" => 15},
    {"Burger" => 12},
    {"Seabass" => 16},
    {"Chips" => 4},
    {"Salad" => 3},
    {"Tiramisu" => 6},
    {"Chocolate fudge cake" => 7}
  ]

  def initialize(items=DEFAULT_ITEMS)
    @items = items
  end
 
  def print_menu
    puts [
      "Starters",
      "(1) Soup of the day £3",
      "(2) Garlic bread £3",
      "",
      "Mains",
      "(3) Pizza £11",
      "(4) Fish and chips £15",
      "(5) Burger £12",
      "(6) Seabass £16",
      "",
      "Desserts",
      "(7) Chips £4",
      "(8) Salad £3",
      "",
      "Sides",
      "(9) Tiramisu £6",
      "(10) Chocoate fudge cake £7",
      ""
      ].join("\n")
  end

end