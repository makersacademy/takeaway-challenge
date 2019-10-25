require 'takeaway_dish'
require 'takeaway_menu'
require 'takeaway_order'

class Takeaway

  attr_reader :takeaway_menu, :takeaway_order_class

  def initialize(args)
    @takeaway_menu = args[:takeaway_menu]
    @takeaway_order_class = args[:takeaway_order_class] || TakeawayOrder
  end

  def start_new_order
    takeaway_order_class.new(takeaway_menu)
  end
end
