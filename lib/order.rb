require './lib/menu'
require 'time'

class Order

  def initialize(menu = Menu.new)
    @menu = Menu.new
    @current_order = []
    @order_total = 0
  end

  def select(item)
    fail "dish does not exist" unless @menu.day_menu.any? {|menu| menu[:item] == item}
    @current_order << item
  end

  def calc_tot
    @current_order.each do |item|
      @order_total += @menu.day_menu[item-1][:price]
    end
    @order_total
  end

  def send_notification
    eta = (Time.now + 3600).strftime("%H:%M")
    notification = "Thank you, you order has been received and will be delivered before #{eta}"
  end


end
