require_relative "menu"
require_relative "sms"
require_relative "order"

class Takeaway

  def initialize(menu:, config:, order: nil, sms: nil)
    @menu = menu
    @order = order || Order.new(menu)
    @sms = sms || SMS.new(config)
  end

  def menu_display
    menu.display
  end

  def place_order(dishes)
    add_dishes(dishes)
    sms.deliver
    order.total
  end

  private
  attr_reader :menu, :order, :sms

  def add_dishes(dishes)
    dishes.each do |dish,quantity|
      order.add(dish,quantity)
    end
  end

end
