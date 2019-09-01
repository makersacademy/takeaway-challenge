require './lib/menu'
require 'time'

class Order

  def initialize(menu = Menu.new)
    @menu = Menu.new
    @current_order = []
    @order_total = 0
  end

  def print_menu
    @menu.print_menu(@menu.menu)
  end

  def select(item)
    raise 'dish does not exist' unless @menu.item_available?(item)

    @current_order << item
  end

  def calc_tot
    @current_order.each do |item|
      @order_total += @menu.menu[item - 1][:price]
    end
    @order_total
  end

  def send_notification
    eta = (Time.now + 3600).strftime("%H:%M")
    "Thank you, you order has been received and will be delivered before #{eta}"
  end


end
