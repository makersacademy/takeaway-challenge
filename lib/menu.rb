class Menu
  attr_reader :menu_list
  MENU = {icecream: 5, dohnuts: 2, potatoes: 1}

  def initialize(menu=MENU)
    @menu_list = menu
  end

  def price(food)
    @menu_list[food.to_sym]
  end

end
