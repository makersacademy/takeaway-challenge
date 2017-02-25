require_relative 'order'
require_relative 'menu'

class Takeaway

def initialize
  @menu = Menu.new
end

def see_menu
  @menu.display
end

def select_dishes(*dishes)
  @order = Order.new
  @order.assign_dishes(dishes)
end

end
