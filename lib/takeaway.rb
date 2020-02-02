require_relative "menu.rb"

class Takeaway
  
  def initialize(menu: Menu.new)
    @menu = menu
    @order = {}
  end

  def add(item)
    raise "Item not in menu, please check spelling" unless @menu.dishes.key?(item.to_sym)
    @order[item] = 1
  end

  def show_menu
    @menu.dishes
  end

  def order
    @order
  end

end