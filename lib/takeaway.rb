require_relative 'menu'
require_relative 'sms'

class Takeaway

  attr_reader :menu, :message
  attr_accessor :order

  def initialize(klass1, klass2)
    @order = []
    @message = klass2
    @menu = klass1.new
  end

  def place_order(item, quantity=1)
    self.order << {:item=>item, :qty=>quantity}
    "#{quantity}x #{item} added to your order"
  end

  def send_confirmation_message(message)
    @message.new.send_sms(message)
  end

  def view_order
    @order.each { |line| puts "#{line[:qty]}x #{line[:item]}" }
  end

  def calculate_total
    self.order.each.inject(0) { |sum, line| sum + (@menu.menu_items[line[:item]] * line[:qty])}
  end

  def send_confirmation_message(message)
    @message.new.send_sms(message)
  end

  def confirm_order(total)
    return "Incorrect Total" if total != calculate_total
    send_confirmation_message('Thank you! Your order was placed and will be delivered before ' + (Time.now + 3600).strftime("%R"))
    "Thank you for your order: £" + "%.2f" % total
  end

end
