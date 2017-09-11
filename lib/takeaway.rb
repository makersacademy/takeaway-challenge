require_relative 'menu'
require_relative 'order'

class TakeAway

  attr_accessor :order
  attr_reader :menu, :sms

  def initialize(menu = Menu.new, order = Order.new, sms: nil)
    @menu = menu
    @order = order
    @sms = sms
  end

  def print_menu
    menu.menu_items.each { |food, price| print "Food:#{food} : £#{price}" }
  end

  def place_order(dishes)
    dishes.each do |dish, quantity|
      order.add(dish, quantity)
    end
      sms.deliver
  end
  # Need to refactor the layout

end
