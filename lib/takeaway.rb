require './lib/menu.rb'
require './lib/order.rb'
require './lib/message.rb'

class Takeaway
  attr_reader :dishes, :menu, :order
  def initialize(menu, order, message)
    @menu = menu
    @order = order
    @message = message
  end

  def visualise_menu
    @menu.show_menu
  end

  def add_to_order(dish, quantity = 1)
    raise "item not available" unless @menu.in_menu?(dish)

    @order.add_dish(dish, quantity)
    "#{dish} X #{quantity} added to your order"
  end

  def place_order(checking_number)
    raise "wrong amount" if checking_number != @order.order_price
    
    @message.send_message
  end
end
