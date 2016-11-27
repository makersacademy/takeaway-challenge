require './lib/menu'
require './lib/order'
require './lib/SMS'
require 'dotenv'
Dotenv.load

class Takeaway

  attr_reader :menu, :order, :message_type

  DEFAULT_QUANTITY = 1

  def initialize(klass1, klass2, klass3)
    @menu = klass1
    @message_type = klass2
    @order = klass3
  end

  def read_menu
    @menu.view_menu
  end

  def create_order
    @order.new
  end

  def select_item(item, quantity = DEFAULT_QUANTITY)
    return "Not a valid item" if !@menu.in_menu?(item)
    add_to_basket(item, quantity)
  end

  def confirm_order(total)
    return "Incorrect Total" if total != @order.calculate_total
    #send_confirmation_message('Thank you! Your order was placed and will be delivered before ' + (Time.now + 3600).strftime("%R"))
    return "Thank you for your order: £" + "%.2f" % total
  end

  private

  def add_to_basket(item, quantity)

    "#{quantity}x #{item} added to your basket"
  end

  def send_confirmation_message(message)
    @message_type.new.send_sms(message)
  end


end
