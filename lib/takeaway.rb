require_relative 'menu'
require_relative 'order'

class Takeaway

  attr_reader :see_menu

  # def initialize
  #   @menu =  Menu.new
  # end

  def see_menu
    @menu = Menu.new
    @menu.menu_list
  end

  # def make_an_order
  #   @order = Order.new
  # end



end
