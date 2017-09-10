require_relative 'menu'
require_relative 'order'

class TakeAway

  attr_accessor :order
  attr_reader :menu

  def initialize(menu = Menu.new, order = Order.new)
    @menu = menu
    @order = order
  end

  def print_menu
    menu.menu_items.each { |food, price| print "Food:#{food} : £#{price}" }
  end

  def place_order(dishes)
    dishes.each do |dish, quantity|
      order.add(dish, quantity)
    end
  end
  # Need to refactor the layout

end
