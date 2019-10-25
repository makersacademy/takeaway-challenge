require 'takeaway_dish'
require 'takeaway_menu'
require 'takeaway_order'
require 'print_menu'
require 'total_checker'

class Takeaway

  attr_reader :takeaway_menu, :takeaway_order_class, :menu_printer, :total_checker

  def initialize(args)
    @takeaway_menu = args[:takeaway_menu]
    @takeaway_order_class = args[:takeaway_order_class] || TakeawayOrder
    @menu_printer = args[:print_module] || PrintMenu
    @total_checker = args[:total_checker] || TotalChecker
  end

  def place_order(takeaway_order)
    raise "The cost of your basket is incorrect!" unless total_checker.check_basket_total(takeaway_order)
    print "Your order has been accepted, you will receive a text message confirmaton shortly!"
  end

  def time_in_one_hour
    (Time.now + 3600).strftime("%H:%M")
  end

  def new_order
    takeaway_order_class.new(takeaway_menu)
  end

  def start_new_order
    takeaway_order_class.new(takeaway_menu)
  end

  def display_menu
    menu_printer.print_menu(takeaway_menu.takeaway_dishes)
  end
end
