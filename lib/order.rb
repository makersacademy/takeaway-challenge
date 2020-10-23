require_relative 'menu'
class Order
  attr_reader :order_list
  def initialize(menu_class:)
    @menu = menu_class
    @order_list = []
  end

  def menu
    @menu.new
  end

  def select(menu_dish_no, how_many)
    list = menu.menu
    @order_list << { item_and_price: list[menu_dish_no - 1], quantity: how_many }
  end
end
