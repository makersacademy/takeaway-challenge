require 'order'
require 'sms'

class Takeaway

  def initialize(menu:, order: nil, sms: sms)
    @menu = menu
    @order = order || Order.new(menu)
    @sms = sms || SMS.new
  end

  def show_menu
    menu.print
  end

  def place_order(items)
    add_items(items)
    sms.deliver
    order.total
  end

  private

  attr_reader :menu, :order, :sms

  def add_items(items)
    items.each do |item, quantity|
      order.add(item, quantity)
    end
  end
end
