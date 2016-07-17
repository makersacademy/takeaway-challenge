
class TakeAway

attr_reader :menu, :order


def initialize(menu: menu, order: nil)
  @menu = menu
  @order = order
end

def print_menu
  menu.print_this
end

def place_order(dishes)
  dishes.each do |dish, quantity|
    order.add(dish,quantity)
  end
    order.total
end



end
