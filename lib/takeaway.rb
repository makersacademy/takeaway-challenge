## This is the user interface
require_relative 'menu'
require_relative 'message'
require_relative 'order'


class Takeaway


  def initialize
    @order = Order.new
  end

  def view_menu
    MENU
  end


  def select_food 
   order.select_food
  end

  def view_order
    order.view_order
  end

  def show_bill
    order.show_bill
  end

  def confirm_order(message = Message.new)
   message.send_text
  end

  private
 
  attr_reader :order

end
