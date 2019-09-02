require './lib/menu'
require 'time'

class Order

  def initialize(menu = Menu.new)
    @menu = Menu.new
    @current_order = []
  end

  def print_menu
    @menu.print_menu(@menu.menu)
  end

  def select(item)
    raise 'dish does not exist' unless @menu.item_available?(item)

    @current_order << item
  end

  def calc_order
    order_total = 0
    @current_order.each do |item|
      order_total += @menu.get_item_price(item)
    end
    order_total
  end

  def basket

  end

  def send_notification
    eta = (Time.now + 3600).strftime("%H:%M")
    "Thank you, you order has been received and will be delivered before #{eta}"
  end


end
