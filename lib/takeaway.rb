require 'menu.rb'
require 'order.rb'
class Takeaway
  attr_reader :menu, :place_order
def initialize(menu = Menu.new)
  @menu = menu
  # @new_order = new_order
end
  def print_menu
    menu.print
  end
  #  def place_order
  #   new_order.add_to_basket(item, quantity)
  #   "#{quantity}x #{item}(s) have been added to your order."
  # end
  # def basket_summary
  #   order.basket_sum(menu)
  # end
end
