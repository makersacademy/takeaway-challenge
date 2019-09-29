require_relative 'order'
require_relative 'sms'
require_relative 'menu'

class Restaurant

  def initialize(menu:, config:, order: nil, sms: nil)
    @menu = menu
    @order = order || Order.new(menu)
    @sms = sms || SMS.new(config)
  end

  def print_menu
    menu.print
  end

  def place_order(choices)
    add_items(choices)
    sms.deliver
    order.order_total
  end

  private

  attr_reader :menu, :order, :sms

  def add_items(choices)
    choices.each do |item, quantity|
      order.add(item, quantity)
    end
  end

end
