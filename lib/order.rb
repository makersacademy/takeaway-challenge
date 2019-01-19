require_relative 'menu'

class Order < Menu
attr_reader :order_list

def initialize
  @order_list = []
  @menu = Menu.new.menu
end

def make_order(dish)
  dish_list = @menu.list
  dish_list.assoc(dish) #@menu.assoc(:soup)
end

def order_summary
end

end
