require_relative 'menu'
require_relative 'order'
require_relative 'sms'



class Takeaway

  attr_reader :menu, :order_klass, :sms
  attr_accessor :order

  def initialize(menu_klass, order_klass, sms_klass)
    @menu = menu_klass.new
    @order_klass = order_klass
    @sms = sms_klass.new
  end

  def view_menu
    menu.print
  end

  def begin_order
    @order = order_klass.new(menu)
  end

  def add(item,quantity=1)
    order.add(item,quantity)
  end

  def price_correct?(price)
    price == order.total
  end

  def place_order(price)
    fail "Price is incorrect" if !price_correct?(price)
    send_sms
  end

  def send_sms
    sms.send
  end


end
