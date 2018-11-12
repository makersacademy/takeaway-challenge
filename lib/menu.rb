class Menu
attr_reader :menu, :selected_items
MENU = {
  "Spider Roll" => 7,
  "Rainbow Roll" => 5,
  }

  def initialize
    @selected_items =[]
    @menu = MENU
  end

  def print_menu
    p MENU
  end

  def select_items(item, quantity)
    quantity.times { @selected_items << @menu[item] }
  end

end
