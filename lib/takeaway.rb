class TakeAway

def initialize(menu:, order: nil)
  @menu = menu
  @order = order || Order.new
end

def view_menu
  menu.print
end

def place_order(dishes)
  dishes.each { |dish, quantity| order.add(dish, quantity) }
  order.total
end
private

attr_reader :menu, :order

end
