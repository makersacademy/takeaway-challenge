require_relative "order"
require_relative "menu"

class Takeaway
  def initialize(menu:, order: nil)
    @menu = menu
    @order = order
  end
  
  def print_menu
    menu.menu_print
  end
  
  def place_order(dishes)
    dishes.each do |item, quantity|
      order.add(item, quantity)
    end
  end
  
  def reciept
    order.total
  end
  
  private
  
  attr_reader :menu, :order
end
