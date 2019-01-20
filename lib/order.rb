require 'twilio-ruby'
require_relative 'menu'
require_relative 'sms'

class Order
  attr_reader :receipt, :menu

  def initialize
    @menu = Menu.new
    @receipt = []
  end

  def select_dish(dish, quantity)
    quantity.times { @receipt << @menu.menu[dish.to_sym] }
    "#{quantity}x #{dish}(s) added to your basket."
  end

  def total
    "Total: £#{@receipt.sum}"
  end

  def checkout
    sms = Sms.new
    sms.send_sms
  end
end
