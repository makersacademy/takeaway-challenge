require_relative 'menu'
require_relative 'order'

class Cafe
  attr_reader :order, :dish, :basket

  def initialize(order = Order.new)
    @order = order
    @dish = dish
    @basket = []
  end

  def display(menu = Menu.new)
    menu.show_menu
  end

  def select_dishes(dish)
    @basket = order.add_to_basket(dish)
  end

end
