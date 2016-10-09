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
  end

end
