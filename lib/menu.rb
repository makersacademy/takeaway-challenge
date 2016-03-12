class Menu

  def initialize
    @menu = Hash.new
  end

  def add_to_menu(item,price)
    @menu[item] = price
  end

  def list
    @menu.dup
  end

  def price item
    @menu[item]
  end
end
