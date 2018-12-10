require_relative 'menu'
require_relative 'order'
require_relative 'bill'
require_relative 'sms_confirm'

class Takeaway

  attr_reader :menu, :order, :bill, :sms

  def initialize(menu = Menu, order = Order.new, bill = Bill.new, sms = SMS.new)
    @menu = menu
    @order = order
    @bill = bill
    @sms = sms
  end

  def show_menu
    @menu.new.show
  end

  def choose_order
    @order.input
  end

  def bill
    @bill.total(@order.total_order)
    @bill.show(@order.total_order)
  end

  def confirm_order
    @sms.send_confirmation
  end

end
