#This class is the user interface for a takeaway order system
require_relative 'menu'
require_relative 'order'
require_relative 'sms'

class Takeaway

  attr_reader :menu, :order_class, :sms
  attr_accessor :order

  def initialize(:menu, :order_class, :config, sms: nil)
    @menu = menu
    @order_class = order_class
    @sms = sms || Sms.new(config)
  end

  def read_menu
    menu.print
  end

  def begin_order
    @order = order_class.new(menu)
  end

  def add(item, quantity=1)
    order.add(item, quantity)
  end

  def place_order(price)
    fail "Price is incorrect" if !price_correct?(price)
    send_sms
  end

  private

  def price_correct?(price)
    price == order.total
  end

  def send_sms
    sms.send
  end

end
