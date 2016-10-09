require_relative 'order'
require_relative 'menu'

class Restaurant
  attr_reader :order

  def initialize(menu)
    @menu = menu
    @menu.read_menu
  end

  def see_menu
    # TODO: how do I test this?
    puts @menu
  end

  def add_to_order(dish, quantity = 1)
    if @order.nil?
      @order = Order.new(@menu)
    end
    @order.add_to_order(dish, quantity)
  end

  def order_items
    @order.items
  end

  def order_total
    @order.order_total
  end

  def finalize_order
    @order = nil
  end
end
