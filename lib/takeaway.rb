require 'order'
require 'sms'

class Takeaway

  attr_reader :menu, :order, :sms

  def initialize(menu:, order: nil, sms: nil)
    @menu = menu
    @order = order || Order.new(menu)
    @sms = sms || SMS.new
  end

  def print_menu
    menu.print_menu
  end

  def place_order(dishes)
    dishes.each do |dish, number|
      order.add(dish, number)
    end
    sms.deliver
    order.total
  end
end
