require 'order'

class Takeaway
def initialize(menu:, order: nil)
  @menu = menu
  @order = order
end

def print_menu
  menu.print
end

def make_order(dishes)
  dishes.each do |dish, quantity|
    order.add(dish, quantity)
 end
 order.total

end

private

attr_reader :menu, :order
end


# def menu
# menu = [ 'Edamame', 'Vegetabe spring roll', 'Salmon roll', 'Cucumber roll']
# end
#
# def price(food)
# menu[0] = 2
# menu[1] = 3
# menu[2] = 4
# menu[3] = 4
# end
