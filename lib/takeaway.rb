require_relative 'menu'


class Takeaway

  attr_reader :order

def initialize
  @menu = Menu.new
  @order = []
end

def view_menu
  @menu.dishes
end

def add_to_order(dish)
  @order << dish
end

end
