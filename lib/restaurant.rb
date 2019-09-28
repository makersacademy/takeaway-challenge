require_relative 'order'
require_relative 'sms'

class Restaurant

  def initialize(menu:, config:, order: nil, sms: nil)
    @menu = menu
    @order = order || Order.new(menu)
    @sms = sms || SMS.new
  end

  def print_menu
    menu.print
  end

  def place_order(items)
    add_items(items)
    sms.deliver
    order.order_total
  end

  private

  attr_reader :menu, :order, :sms

  def add_items(items)
    items.each do |item, quantity|
      order.add(item, quantity)
    end
  end

end
