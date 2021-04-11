class Menu
  attr_reader :menu_list

  def initialize
    @menu_list = []
  end

  def update_menu_list(menu, price, availability = true)
    @menu_list << { dish: menu, price: price, available?: availability }
  end

  def update_availibility(dish, is_available)
    @menu_list.map { |item| item[:available?] = is_available if item[:dish] == dish }
  end

end
