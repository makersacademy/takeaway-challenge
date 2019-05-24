require './lib/Order.rb'

class Customer
  attr_reader :order
  
  def initialize(order=Order)
    @order = order.new
  end

  def view_menu
    @order.view_menu
  end
end
