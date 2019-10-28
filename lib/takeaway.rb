require 'dotenv'
Dotenv.load

require 'takeaway_dish'
require 'takeaway_menu'
require 'takeaway_order'
require 'print_menu'
require 'total_checker'
require 'sms_sender'

class Takeaway

  attr_reader :takeaway_menu, :takeaway_order_class, :menu_printer, :total_checker, :sms_sender

  def initialize(args)
    @takeaway_menu = args[:takeaway_menu]
    @takeaway_order_class = args[:takeaway_order_class] || TakeawayOrder
    @menu_printer = args[:print_module] || PrintMenu
    @total_checker = args[:total_checker] || TotalChecker
    @sms_sender = (args[:sms_sender] || SMSSender).new(:twilio_client => (args[:twilio_client] || TwilioClient))
  end

  def place_order(takeaway_order)
    raise "The cost of your basket is incorrect!" unless total_checker.check_basket_total(takeaway_order)
    print "Your order has been accepted, you will receive a text message confirmaton shortly!"
    sms_sender.message("Your order is confimed and will be with you before #{time_in_one_hour} else you can get your money back! Thank you for ordering from China Palace")
  end

  def start_new_order
    takeaway_order_class.new(takeaway_menu)
  end

  def display_menu
    menu_printer.print_menu(takeaway_menu.takeaway_dishes)
  end

  def time_in_one_hour
    (Time.now + 3600).strftime("%H:%M")
  end
end
