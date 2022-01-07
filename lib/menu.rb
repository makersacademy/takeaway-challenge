class Menu

  attr_reader :menu

  def initialize
    @menu = {}
  end

  def add_dish(name, price)
    @menu[name] = price
  end

  def dish_in_menu?(name)
    return !@menu[name].nil?
  end
end
