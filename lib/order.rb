#require 'menu'
class Order
  attr_reader :order_price, :valid_item
  def initialize
    @menu = Menu.new
    @current_order = []
    @order_price = 0
  end


end