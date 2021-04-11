class Menu
  attr_reader :menu_list

  def initialize
    @menu_list = []
  end

  def update_menu_list(menu, price)
    @menu_list << {dish: menu, price: price}
  end
end