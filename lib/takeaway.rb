require_relative 'menu'
require_relative 'order'
require_relative 'message'

class Takeaway
  def initialize(menu = Menu.new, order = Order.new(menu), message = Message.new)
    @menu = menu
    @order = order
    @message = message
  end 

  def show_menu
    @menu.view_menu
  end

  def place_order(dishes)
    add_to_basket(dishes)
    complete_order
    print_total
  end

private

  def add_to_basket(dishes)
    dishes.each do |dish, quantity| @order.add_to_basket(dish, quantity)
    end
  end

  def complete_order
    @message.send
  end

  def print_total
    @order.total
  end 
  
end 


