require 'takeaway_dish'
require 'takeaway_menu'
require 'takeaway_order'

class Takeaway

  attr_reader :takeaway_menu, :takeaway_order_class

  def initialize(args)
    @takeaway_menu = args[:takeaway_menu]
    @takeaway_order_class = args[:takeaway_order_class] || TakeawayOrder
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
end
