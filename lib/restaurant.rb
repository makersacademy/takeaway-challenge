require './lib/menu'
require './lib/order'

class Restaurant
  attr_reader :menu, :basket, :order_item

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = []
    @order_item = nil
  end

  def see_menu
    @menu.dishes
  end

  def add_to_order(dish, quantity = 1)
    @order_item = Order.new(dish, quantity)
    raise 'This dish is not on the menu' unless item_on_menu?(dish)

    store_order_item
  end

private

  def store_order_item
    @basket << @order_item
  end

  def item_on_menu?(item)
    @menu.dishes.has_key?(item)
  end
end
