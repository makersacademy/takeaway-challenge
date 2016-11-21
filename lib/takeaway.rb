#user interface for a takeaway order system

require_relative 'menu'
require_relative 'order'
require_relative 'sms'
require 'dotenv'
Dotenv.load

class Takeaway

  attr_reader :menu, :order_klass, :sms
  attr_accessor :order

  def initialize(menu: , config: , order_klass: , sms: nil)
    @menu = menu
    @order_klass = order_klass
    @sms = sms || SMS.new(config)
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
