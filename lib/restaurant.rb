require 'order'

class Restaurant

  def initialize(menu:, config:, order: nil, sms: nil)
    @menu = menu
    @order = order || Order.new(menu)
    @sms = sms || SMS.new(config)
  end

  def show_menu
    menu.print_menu
  end

  def place_order(menu_items)
    add_items(menu_items)
    sms.deliver
    order.total
  end

  private

  attr_reader :menu, :order, :sms

  def add_items(menu_items)
    menu_items.each do |item, quantity|
      order.add(item, quantity)
    end
  end

end
