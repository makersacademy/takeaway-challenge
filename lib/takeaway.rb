require 'order'
require 'sms'

class Takeaway

  def initialize(menu:, order: nil, sms: nil)
    @menu = menu
    @order = order || Order.new(menu)
    @sms = sms || SMS.new
  end

  def print_menu
    menu.print
  end

  def place_order(dishes)
      dishes.each do |dish, quantity|
        order.add(dish, quantity)
      end
      sms.deliver
      order.total
  end

  private

  attr_reader :menu, :order, :sms

end
