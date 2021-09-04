require_relative 'menu'

class Restaurant
  attr_accessor :order
  attr_reader :menu

  def initialize
    @order = nil
    @menu = Menu.new
  end

  def receive_order(order)
    @order = order
  end

  def confirm_order
    raise 'Restaurant has not received any orders' if !@order


  end
end
