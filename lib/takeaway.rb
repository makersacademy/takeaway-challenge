require_relative 'menu'
require_relative 'order'
require_relative 'confirmation'
require 'date'

class Takeaway

  attr_reader :order

  def initialize(menu = Menu)
    @menu = menu.new
  end

  def view_menu
    @menu.show_menu
  end

  def new_order(order = Order)
    @order = order.new
  end

  def add_item(item)
    @order.add_item({ item => @menu.dishes[item] })
    @order.add_price(@menu.dishes[item])
  end

  def view_order
    @order.display_order
  end

  def place_order(sms_confirmation = Confirmation)
    order = @order
    @sms_confirmation = sms_confirmation.new
    @sms_confirmation.send_confirmation(order)
  end
end
