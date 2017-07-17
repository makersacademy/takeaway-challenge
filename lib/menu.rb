class Menu
  def initialize
    @menu = { tuna: 4, frog: 1, lamb: 2, pork: 3 }
  end
  def get_menu
    @menu
  end
  def add_menu(item, price)
    @menu[item.to_sym] = price
  end
  
end
