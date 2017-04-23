require_relative 'menu'
require_relative 'order'


class Takeaway

  attr_reader :menu, :order_list

  def initialize
    @menu = Menu.new
    @order_list = {}
  end

  def show_menu
    menu.print_menu
  end 

end
