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

  private

  def items_not_on_menu(order)
    order.items.uniq - @menu.keys
  end
end
