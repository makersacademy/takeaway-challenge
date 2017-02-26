require_relative 'menu'

class Takeaway

attr_reader :basket

def initialize(menu=Menu.new)
  @basket = Hash.new(0)
  @menu = menu
end

def see_menu
  @menu.display
end

def select_dishes(*dishes)
  @order = Order.new
  @order.assign_dishes(dishes)
end

end
