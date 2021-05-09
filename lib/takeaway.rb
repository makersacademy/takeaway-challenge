require 'menu'
require 'order'
class Takeaway 
  attr_reader :menu, :order
  def initialize(menu = Menu.new, order = Order.new)
    @menu = menu
    @order = order
  end
end