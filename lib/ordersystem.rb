require_relative 'takeaway_kitchen'

class OrderSystem
  attr_reader :menu

  def initialize
    @menu = TakeawayKitchen.new.menu
  end

  def view_menu
    menu
  end
end
