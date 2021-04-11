require_relative 'menu'

class Order
  attr_reader :order_placed

  def initialize
    @order_placed = []
  end

  def add(request)
    fail 'That item is not available' if check_menu(request) == false
    
    @order_placed << request
  end

  def check_menu(request)
    menu = Menu.new
    menu.see_menu.include? request
  end
end
