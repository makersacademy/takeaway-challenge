require "./lib/menu.rb"
require "./lib/order.rb"

class Restaurant
  attr_reader :order, :basket

  def initialize(order = Order.new, menu = Menu.new)
    @order = order
    @menu = menu
    @dish = dish
    @total = total
  end

  def display_menu(menu = Menu.new)
    menu.show_menu
  end

  def add_to_basket(dish)
    menu.excist(dish)
    order.add(dish)
  end

  def display_basket
    order.basket
  end

  def checkout(total)
    order.sub_total(total)
  end
end
