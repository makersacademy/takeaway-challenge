require_relative 'menu'
require_relative 'order'

class Takeaway

  attr_reader :menu, :order

  def initialize(menu = Menu.new, order = Order.new)
    @menu = menu
    @order = order
  end

  def print_menu
    @menu.list
  end

  def order(dishes)
    order_item(dishes)
    order.total
  end

  private

  def order_item(dishes)
    dishes.each do |dish, quantity|
      order.add(dish, quantity)
    end
  end


end
