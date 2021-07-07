require "order"
require "sms"

class Takeaway

  attr_accessor :menu, :order, :sms

  def initialize(menu:, config:, order: nil, sms: nil)
    @menu = menu
    @order = order || Order.new(menu)
    @sms = sms || SMS.new(config)
  end

  def print_menu
    menu.print
  end
  
  def order_up(dishes)
    add_dishes(dishes)
    sms.deliver
    order.total
  end

  def add_dishes(dishes)
    dishes.each do |dish, amount|
      order.add(dish, amount)
    end
  end
end