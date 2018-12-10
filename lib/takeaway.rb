require "order"
require "menu"

class Takeaway

  attr_reader :menu, :order, :sms

  def initialize(menu:, order: Order.new(menu), sms: SMS.new)
    @order = order
    @menu = menu
    @sms = sms
  end

  def see_menu
    menu.print_menu
  end

  def place_order(choices)
    choices.each do |food, quantity|
      order.add_to_order(food, quantity)
    end
    sms.delivery
    order.total
  end
end
