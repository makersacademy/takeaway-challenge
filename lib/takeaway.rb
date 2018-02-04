require_relative 'menu'
require_relative 'order'

class Takeaway

  attr_reader :order

  def initialize(menu = Menu, order = Order)
    @menu = menu.new
    @order = order.new
  end

  def print_menu
    @menu.print_centered
  end

  def take_order
    @order.note_down(@menu.options)
  end

  def verify_current_order
    @order.print_verification(@menu.options)
  end

  def sms_confirmation
    @order.send_verification_text
  end

  def finish_order
    @order = Order.new
  end

end
