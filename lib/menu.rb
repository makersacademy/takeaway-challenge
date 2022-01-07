class Menu

  attr_reader :menu

  def initialize
    @menu = {}
  end

  def add_dish(name, price)
    @menu[name] = price
  end

  def dish_in_menu?(name)
    return false if @menu[name].nil?
    return true
  end
end
