require_relative 'menu'

class Order
    
  attr_reader :order_list
  
  def initialize
    @menu = Menu.new
    @order_list = []
  end
  
  def order(user_input)
    @order_list = user_input
  end
  
end
