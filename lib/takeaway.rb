require './lib/menu'

class Takeaway

  attr_reader :menu, :active_orders, :order_history
  
  def initialize
    @menu = Menu.new
    @active_orders = Array.new
    @order_history = Array.new
  end
end
