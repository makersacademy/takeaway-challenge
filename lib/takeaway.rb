require 'twilio-ruby'
require_relative 'message'
require_relative 'menu'
require_relative 'order'

class Takeaway

  attr_reader :order

  def initialize
    @order = Order.new
  end

  def menu_list
    @order.show_menu
  end

  def choose_item(item_num)
    @order.select_item(item_num)
  end

  def order_info
    @order.order_summary
    puts "Your order total is £#{@order.order_price}"
  end

  def place_order
    order_info
    fail "The total order price is different from the dishes on the order" if correct_total? == false
    @message = Message.new.send_message
  end

  private

  def correct_total?
    @order.selection.map{|item| item[:price]}.inject(:+).round(2) == @order.order_price
  end



end
