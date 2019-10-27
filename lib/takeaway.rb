require_relative 'menu'
require_relative 'basket'

class Takeaway

  def initialize(menu = Menu.new)
    @menu = menu
  end

  def show_menu
    @menu.display_menu
  end

  def add_to_order(item, quantity)
    raise "Item not on menu!" if on_menu?(item) == false
    
  end

  private 

  def on_menu?(item)
    @menu.menu.has_key?(item)
  end
end
