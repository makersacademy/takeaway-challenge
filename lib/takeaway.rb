require_relative 'menu'
require_relative 'basket'

class TakeAway

  attr_reader :menu, :basket

def initialize
  @menu = Menu.new
  @basket = Basket.new(@menu.items)
end

def view_menu
  @menu.view_menu
end

def order(item_num)
  basket.add_item(item_num)
end

def view_basket
  basket.selected_items
end


end
