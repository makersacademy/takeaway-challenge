require_relative 'order'
require_relative 'dish'
require_relative 'menu'

class Takeaway

DELIVERY_PRICE = 2.50

  attr_reader :menu, :text
  attr_accessor :order

  def initialize
    @menu = Menu.new.items
    @order = Order.new
  end

  def show_menu
    menu.map do |dish|
      "#{dish.name} -- £#{dish.price}"
    end
  end

  def add_item_to_order(add_dish)
    # raise "This dish is not available" if menu.not_include? add_dish
    menu.each do |dish|
      if dish.name == add_dish
        order.items << dish
        order.total_cost += dish.price
      end
    end
  end

  def order_total
    order.total_cost + DELIVERY_PRICE
  end

end
