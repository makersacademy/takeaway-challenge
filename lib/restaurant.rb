require_relative 'order'

class Restaurant
  def initialize(menu)
    @menu = menu
  end

  def menu
    @menu.clone
  end

  def new_order
    Order.new
  end

  def order_total(order)
    raise "Invalid order - #{items_not_on_menu(order)} are not on the menu" unless items_not_on_menu(order).empty?
    order.items.map { |item| @menu[item] }.sum
  end

  def delivery_time
    Time.now + COOKING_TIME + TRAVEL_TIME
  end

  private

  COOKING_TIME  = 50 * 60
  TRAVEL_TIME   = 10 * 60

  def items_not_on_menu(order)
    order.items.uniq - @menu.keys
  end
end
