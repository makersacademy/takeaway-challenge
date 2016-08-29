require_relative 'menu'
require_relative 'order'
require_relative 'sms'
require 'twilio-ruby'
class User_input
  attr_reader :time

  def initialize(menu_class: Menu, order_class: Order, sms: Sms)
    @order_class = order_class.new
    @menu_class = menu_class
    @sms_class = sms
    @time = Time.now
  end

  def begin
    @order_class.begin_order
    @order_class.record_order
    display_order
  end

  def display_order
    puts "You ordered the following items.."
    puts @order_class.basket
    display_total
  end

  def display_total
    puts "We believe your total to be £#{@order_class.total.to_f}"
    @sms_class.new.send_confirmation_sms(@time + 1*60*60)

  end

  def send_sms
  end
end
