require_relative 'menu'
require_relative 'order'
require_relative 'send_sms'

class Takeaway

  attr_reader :menu, :current_order
  attr_accessor :basket, :sms, :message_sent, :total

  def initialize
    @menu = Menu.new
    @current_order = Order.new
    @total = 0
    @basket = @current_order.basket
    @message_sent = false
    @sms = Sms.new
  end

  def send_sms
    if @message_sent = false
      @sms
      @message_sent = true
    end
  end

  def order(item, quantity = 1)
    @current_order.order(item, quantity)
    @total += @current_order.total
  end

  def show_menu
    @menu
  end

  def check_basket
    @menu.each do |x|
      name = x.key
      count = @basket.count(x[key])
      "#{name} x #{count}"
    end
  end

  def checkout
    @sms
  end

  def total
    "Total: £#{"%.2f" % @total}"
  end

end
