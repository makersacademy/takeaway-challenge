class Menu

  attr_reader :menu_list

  def initialize
    @menu_list = {}
  end

  def add_meal(item, price)
    @menu_list[item] = price
  end

end
