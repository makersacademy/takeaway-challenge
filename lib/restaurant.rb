require_relative 'menu.rb'
require_relative 'order.rb'

class Restaurant

  attr_reader :menu, :order

  def initialize(menu_type = Menu, order_type = Order)
    @menu = menu_type.new
    @order = order_type.new(@menu)
  end

  def show_menu
    menu.print_menus
  end

  def select(item)
    raise "Item not added to basket - please select available items" unless on_menu?(item)
    order.add_to_basket(item)
  end

  def delete(item)
    order.remove_from_basket(item)
  end

  def show_basket
    order.basket
  end

  private

  def on_menu?(item)
    menu.available?(item)
  end
end