require 'menu'

class Takeaway
  attr_reader :menu
  attr_reader :basket
  
  def initialize(menu_class = Menu)
    @menu_class = menu_class
    @menu = nil
    @basket = []
  end

  def view_menu
    @menu = @menu_class.new
    @menu.view
  end

  def select_item(item, quantity)
    items = @menu.select_pizza(item)
    @basket << items
  end
end
