require_relative 'menu.rb'
require_relative 'order.rb'
require_relative 'sms.rb'

class Takeaway

  attr_reader :menu, :order, :sms

  def initialize(menu = Menu.new, order = Order.new, sms = Sms.new)
    @menu = menu
    @order = order
    @sms = sms
  end

  def view_menu
    @menu.view
  end

  def select(item, quantity)
    @order.select(item, quantity)
  end

  def check_order
    @order.check_total
  end

  def place_order
    @sms.send
  end

end
