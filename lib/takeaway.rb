require 'dotenv'
Dotenv.load

require_relative "menu.rb"
require_relative "dish.rb"
require_relative "array_printer.rb"
require_relative "order.rb"
require_relative "order_total_checker.rb"
require_relative "sms_messager.rb"

class Takeaway

  attr_reader :menu, :printer, :order_class, :order_total_checker, :sms_messager

  def initialize(args)
    @menu = args[:menu]
    @printer = args[:printer_module] || ArrayPrinter
    @order_class = args[:order_class] || Order
    @order_total_checker = args[:order_total_checker] || OrderTotalChecker
    @sms_messager = (args[:sms_messager] || SMSMessager).new(:twilio_client_class => (args[:twilio_client] || TwilioClient ))
  end

  def show_menu
    printer.print_array(menu.dishes)
  end

  def place_order(order)
    raise "Your expected total order cost is wrong!" unless order_total_checker.check_total(order)
    print "Your order has been accepted, you will receive a text message confirmaton shortly!"
    sms_messager.message("Your order is confimed and will be ordered before #{time_in_one_hour}")
  end

  def new_order
    order_class.new(menu)
  end

  private

  def time_in_one_hour
    (Time.now + 3600).strftime("%H:%M")
  end

end
