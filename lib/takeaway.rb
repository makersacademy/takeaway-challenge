require_relative 'order'
require_relative 'menu'
require_relative 'sms'

class Takeaway
  
  def initialize(menu:, order: nil, sms: nil)
  @sms = sms || SMS.new
  @menu = menu || Menu.new
  @order = order || Order.new(menu)
  end

  def print_menu
    menu.print
  end

  def order_takeaway(dishes)
    add_dishes_order(dishes)
    sms.deliver
    order.total
  end

  private

  attr_reader :menu, :order, :sms

  def add_dishes_order(dishes)
    dishes.map do |dish, quantity|
      order.add(dish, quantity)
    end
  end
end
