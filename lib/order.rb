class Order
  
  attr_reader :selection
  attr_reader :menu

  def initialize menu
    @selection = {}
    @menu = menu
  end

  def add_item dish, quantity
    return "That item is not on the menu" if !on_menu? dish
    selection.store dish, quantity
  end

  def on_menu? dish
    menu.dishes.include? dish
  end

end