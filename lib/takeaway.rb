require_relative './menu.rb'
require_relative './order.rb'

class TakeAway

  attr_reader :order, :menu, #:dishes

  def initialize
    #@dishes = { hotdog: 5.00, fries: 3.50 }
    @order = {}
    @menu = Menu.new
  end

  def place_order
    @order = Order.new
  end
  
end
