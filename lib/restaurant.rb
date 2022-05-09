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
    @menu.dishes.map { |dish, price| "#{dish}: £#{price}" }
  end

  def add_to_order(dish, quantity = 1, total)
    @order_item = Order.new(dish, quantity, total)
    raise 'This is not on the menu' unless item_on_menu?(dish)

    store_order_item(dish, quantity, total)
  end

  def see_basket
    @basket.map { |item| "#{item[:dish]} x#{item[:quantity]} = £#{item[:total]}" }
  end

private

  def store_order_item(dish, quantity, total)
    @basket << { dish: dish, quantity: quantity, total: total }
  end

  def item_on_menu?(item)
    @menu.dishes.has_key?(item)
  end
end
