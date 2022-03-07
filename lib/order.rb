require 'menu.rb'

class Order
  def initialize(menu = Menu.new)
    @new_menu = menu
    @basket_total = 0
    @order = []
  end

  def add_order(dish)
    raise "Item not on the menu" unless @new_menu.menu.key?(dish)
    @order.push(dish)
  end

  def print_order
    @order
  end
end