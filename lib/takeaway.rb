require 'takeaway_dish'
require 'takeaway_menu'
require 'takeaway_order'
require 'print_menu'

class Takeaway

  attr_reader :takeaway_menu, :takeaway_order_class, :menu_printer

  def initialize(args)
    @takeaway_menu = args[:takeaway_menu]
    @takeaway_order_class = args[:takeaway_order_class] || TakeawayOrder
    @menu_printer = args[:print_module] || PrintMenu
  end

  def place_order
    print "Your order has been accepted, you will receive a text message confirmaton shortly!"
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
