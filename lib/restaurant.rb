require_relative 'order'

class Restaurant
  def initialize(menu)
    @menu = menu
  end

  def menu
    @menu.clone
  end

  def order_total(order)
    check_items_available(order)
    order.items.map { |item| @menu[item] }.sum
  end

  def delivery_time
    Time.now + COOKING_TIME + TRAVEL_TIME
  end

  def place_order(order)
    raise 'Order must contain at least one item' if order.items.empty?
    check_items_available(order)
  end

  private

  COOKING_TIME  = 50 * 60
  TRAVEL_TIME   = 10 * 60

  def check_items_available(order)
    error_msg = "Invalid order - #{items_not_on_menu(order)} are not on the menu"
    raise error_msg unless items_not_on_menu(order).empty?
  end

  def items_not_on_menu(order)
    order.items.uniq - @menu.keys
  end
end
