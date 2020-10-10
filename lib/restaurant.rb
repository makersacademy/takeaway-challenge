class Restaurant

  RESTAURANT_NAME = "Rex Whistler Restaurant"
  LIST_OF_DISHES = {
    "Malt Loaf Rarebit" => 10,
    "Shellfish Raviolo" => 16,
    "Hampshire Trout Duo" => 11,
    "Pressed Game Terrine" => 14,
    "Yorkshire Wolds Duck" => 22,
    "Loch Duart Salmon" => 19,
    "Celeriac Steak" => 18,
    "Pistachio Pudding" => 9,
    "Alfio's Affogato" => 8,
    "Coconut & Mango" => 7
  }

  attr_reader :list_of_dishes, :menu

  def initialize
    @name = RESTAURANT_NAME
    @list_of_dishes = LIST_OF_DISHES
    @menu = Menu.new
  end

end
