class Menu

  REX_WHISTLER_MENU_ITEMS = [
    MenuItem.new("Malt Loaf Rarebit", 10, "starter"),
    MenuItem.new("Shellfish Raviolo", 16, "starter"),
    MenuItem.new("Hampshire Trout Duo", 11, "starter"),
    MenuItem.new("Pressed Game Terrine", 14, "starter"),
    MenuItem.new("Yorkshire Wolds Duck", 22, "main"),
    MenuItem.new("Loch Duart Salmon", 19, "main"),
    MenuItem.new("Celeriac Steak", 18, "main"),
    MenuItem.new("Pistachio Pudding", 9, "dessert"),
    MenuItem.new("Alfio's Affogato", 8, "dessert"),
    MenuItem.new("Coconut & Mango",  7, "dessert")
  ]
  attr_reader :items

  def initialize(items = REX_WHISTLER_MENU_ITEMS)
    @items = items
  end

  def to_s
    items.map { |item| item.to_s }
    .join("\n")
  end

end
