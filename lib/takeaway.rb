require_relative 'menu'
require_relative 'order'
require_relative 'sms'

class Takeaway

  attr_reader :order

  def initialize(menu, order = nil, sms = Sms.new)
    @menu = menu
    @order = order || Order.new(menu)
    @sms = sms
  end

  def view_menu
    @menu.print_menu
  end

  def choose(dishes)
    dishes.each do |name, quantity|
      @order.add(name, quantity)
    end
  end

  def place_order
    @sms.send_sms
    "Thanks for your order! You will be charged £#{@order.total}. You will receive a confirmation message shortly."
  end
end
