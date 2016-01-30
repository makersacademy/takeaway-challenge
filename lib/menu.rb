class Menu

  attr_reader :menu_list

  def initialize
    @menu_list = {}
  end

  def add(dish, price)
    @menu_list[dish] = price

  end

end