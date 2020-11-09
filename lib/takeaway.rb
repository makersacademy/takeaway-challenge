require_relative './menu.rb'
require_relative './order.rb'

class TakeAway

  attr_reader :order, :menu

  def initialize
    @menu = menu
    @order = order
  end

  def new_order
    @menu = Menu.new
    @order = Order.new
  end

  def place_order
    puts "Your order has been placed"
  end

end
