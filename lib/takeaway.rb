require_relative 'menu'
require_relative 'order'


class Takeaway

  attr_reader :order

def initialize
  @menu = Menu.new
  @order = []
  @order_total = 0
end

def view_menu
  @menu.dishes
end

def add_to_order(dish)
  @order << dish
end

def calculated_total

  @order.each do |dish|
    @order_total += @menu.dishes[dish]
  end
  @order_total

end

end
