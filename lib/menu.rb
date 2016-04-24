class Menu
  attr_reader :menu

  def initialize
    @menu = {:king_burger => 8, :cheese_burger => 7, :chicken_burger => 7 }
  end

  def read
   puts @menu.dup
  end

  def pick(menu_item)
    raise "Sorry, that item is not on the menu" if !@menu.include?(menu_item)
    @menu.select { |key, value| key == menu_item }
  end

  def price(menu_item)
    @menu[menu_item]
  end

end
