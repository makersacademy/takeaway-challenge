require_relative 'menu.rb'
require_relative 'order.rb'

class Restaurant

  attr_reader :menu, :order

  def initialize(menu_type = Menu, order_type = Order)
    @menu = menu_type.new
    @order = order_type.new
  end

  def show_menu
    menu.print_menus
  end

  def starter_menu
    menu.starters
  end

  def main_menu
    menu.mains
  end


end