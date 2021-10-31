require_relative 'menu'
require_relative 'sms'

class Order

  attr_reader :order, :total, :order_summary

  def initialize
    @menu = Menu.new
    @sms = SMS.new
    @order = []
    @order_summary = ""
    @total = 0
  end

  def add_item(item, amount = 1)
    calculate_total(item, amount)
    @order << "#{amount}x #{item} ordered (£#{@menu.menu_items[item] * amount})"
  end

  def calculate_total(item, amount)
    @total += @menu.menu_items[item] * amount
  end

  def show_order_summary
    @order_summary = "#{@order.join(', ')}\nTotal: £#{@total}"
  end

  def place_order
    @sms.send_sms
  end

end
