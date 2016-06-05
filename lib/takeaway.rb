require 'order'

class Takeaway

  def initialize(menu:, order: nil, sms: sms)
    @menu = menu
    @order = order || Order.new
    @sms = sms
  end

  def show_menu
    menu.print
  end

  def place_order(items)
    items.each do |item, quantity|
      order.add(item, quantity)
    end
    sms.deliver
    order.total
  end

  private

  attr_reader :menu, :order, :sms
end
