require 'menu'
require 'order'

class Takeaway
  attr_reader :menu, :order

  def initialize(order = Order.new, menu = Menu.new)
    @order = order
    @menu = menu
  end

  def read_menu
    puts @menu.display_menu
  end

end
